
variable "webservername" {
    type = string
    default = "name of web server must come from the calling module"
}

resource "aws_instance" "WebServer" {
    ami = "ami-055e3d4f0bbeb5878"
    instance_type = "t2.micro"
    security_groups = [module.sg.sgname]
    tags = {
        "Name" = var.webservername
    }
    # can be a file or inline script
    user_data = file("server-script.sh")
    # user_data = <<-EOF
    #             #!/bin/bash
    #             sudo yum update
    #             sudo yum install -y httpd
    #             sudo systemctl start httpd
    #             sudo systemctl enable httpd
    #             echo "<h1>Hello from Terraform</h1>" | sudo tee /var/www/html/index.html
    #             EOF                
}
module "sg" {
    source = "../sg"
    sgname = "sg name from web.tf"
    sgdesc = "sg desc from web.tf"
    # sgdesc = "description hard-coded in sg/sg.tf"
}

module "eip" {
    source = "../eip"
    instance_id = aws_instance.WebServer.id  
    eip_name = "eip name from web.tf"
}

output "pub_ip" {
    value = module.eip.PublicIP
}
