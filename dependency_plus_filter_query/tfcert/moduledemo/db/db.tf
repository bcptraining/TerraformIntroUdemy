variable "dbname" {
    type = string
}


resource "aws_instance" "myec2db" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"
    tags = {
            Name = var.dbname
    }
}

