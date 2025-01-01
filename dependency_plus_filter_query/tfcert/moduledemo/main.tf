provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"
    tags = {
            Name = "Web Server"
    }
  
}

module "dbserver" {
    source = "./db/mysql"
    dbname = "mydbserver"
}

output "privateipweb" {
    value = aws_instance.myec2.private_ip
}
# Note: These names should be (but not required to be) same as the output name of the module
output "dbprivateip" {
    value = module.dbserver.dbprivateip
}
output "dbinstanceid" {
    value = module.dbserver.dbinstanceid
}