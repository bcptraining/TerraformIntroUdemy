
variable "tag_name" {
  type = string
}

resource "aws_instance" "myec2" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"
    tags = {
        Name = var.tag_name
    }
}