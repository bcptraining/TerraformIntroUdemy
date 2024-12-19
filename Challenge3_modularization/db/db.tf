# DB Server, output the private ip

variable "dbservername" {
    type = string
    default = "provide db server name from module"
}


# my stuff below
resource "aws_instance" "DBServer" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"    
    tags = {
        "Name" = var.dbservername
    }
}

output "PrivateIP" {
    value = aws_instance.DBServer.private_ip
}
