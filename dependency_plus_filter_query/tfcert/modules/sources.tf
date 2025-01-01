# data source example (query your infrastructure)
# Note: Only exact match is supported. However, you can achieve this by fetching all instances and then applying additional logic within your Terraform configuration or using a script to filter the results.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance.html
data "aws_instances" "EC2Search" {
    filter {
        name = "tag:Name"  # search for instances with a tag that has the word "Name" in it
        values = ["Db Server", "Web Server"]
    }
}
