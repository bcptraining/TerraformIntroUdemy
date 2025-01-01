provider "aws" {
  region = "us-west-2"
}

# kraken-remote-backup 
resource "aws_s3_bucket" "kraken-remote-backup" {

  bucket = "kraken-remote-backup"
  lifecycle { prevent_destroy = false }
}

#  This resource allows you to access delete files from the bucket
resource "aws_s3_object" "kraken-remote-backup" {
  for_each = fileset("${path.module}/files", "*")
  bucket   = aws_s3_bucket.kraken-remote-backup.bucket
  key      = each.value
  source   = "${path.module}/files/${each.value}"
}


data "aws_s3_objects" "all" {
  bucket = aws_s3_bucket.kraken-remote-backup.bucket
}

output "s3_object_keys" {
    value = data.aws_s3_objects.all
}

resource "aws_s3_object" "delete_all" {
  for_each = toset(data.aws_s3_objects.all.keys)
  bucket   = aws_s3_bucket.kraken-remote-backup.bucket
  key      = each.value
}

#  Here is an alternate approach to delete a specific object from s3 
# Map for Object Deletion: Define a map to hold the object keys you want to delete.
locals {
  objects_to_delete = {
    "deleteme" = "deleteme.txt"
  }
}
# Delete the Object Using the Map: Use the map to conditionally delete the object.
resource "aws_s3_object" "delete_objects" { 
    for_each = local.objects_to_delete 
    count = contains(data.aws_s3_bucket_objects.all.keys, each.value) ? 1 : 0 
    bucket = aws_s3_bucket.kraken-remote-backup.bucket 
    key = each.value 
    provider = aws 
}
