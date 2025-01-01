provider "aws" {
    region = "us-west-2"
}

resource "aws_vpc" "xxx" {
    cidr_block = "10.0.0.0/16"
    tags = {
        cert = "DEA-C01 changed"
    }
}

output "vpc_id" {
    value = aws_vpc.xxx.id
}