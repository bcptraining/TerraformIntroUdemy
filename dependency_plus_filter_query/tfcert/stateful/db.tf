provider "aws" {
    region = "us-west-2"
}

variable "vpcname" {
    type = string
    default = "myvpc"
}
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.vpcname
    }
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.vpcname
    }
}