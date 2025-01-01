
variable "tag_name" {
  type = string
}


variable "instance_type" {
  type = string
  description = "The type of instance to create"
  default = "t2.micro"
}
resource "aws_instance" "myec2" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = var.instance_type
    # instance_type = "t2.micro"
    tags = {
        Name = var.tag_name
    }
}