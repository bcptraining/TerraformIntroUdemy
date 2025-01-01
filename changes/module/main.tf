provider "aws" {
    region = "us-west-2"
}

module "ec2" {
    source = "./ec2"
    for_each = toset(["dev","tst","prd"])
    tag_name = each.value       
}