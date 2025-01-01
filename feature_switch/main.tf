provider "aws" {
    region = "us-west-2"
}

provider "aws" {
    region = "us-west-1"
    alias = "cal" 
}

variable "number_of_servers" { 
    type = number
   
}

variable "environment" {
    type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-055e3d4f0bbeb5878"
    provider = aws.cal
    instance_type = "t2.micro"
    count = var.environment == "prod" ? var.number_of_servers : 0
    tags = {
        Name = var.environment
    }
}