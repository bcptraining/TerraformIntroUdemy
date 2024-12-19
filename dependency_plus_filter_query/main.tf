
provider "aws" {
    region = "us-west-2"
}
resource "aws_instance" "db" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"
     tags = {
            Name = "db server"
    }
}
resource "aws_instance" "web" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"
    depends_on = [ aws_instance.db ]
     tags = {
            Name = "web server"
    }
}

# data source example (query your infrastructure)
# Note: Only exact match is supported. However, you can achieve this by fetching all instances and then applying additional logic within your Terraform configuration or using a script to filter the results.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance.html
data "aws_instance" "dbsearch" {
    filter {
        name = "tag:Name"  # search for instances with a tag that has the word "Name" in it
        values = ["db server"]
    }
}



output "dbservers" {
    value = data.aws_instance.dbsearch.arn
    }