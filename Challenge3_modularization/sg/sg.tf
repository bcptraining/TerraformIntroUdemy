# The sg.tf file creates a security group which allows web traffic and outputs the name of the sg


#Variables 
variable "ingressrules" {
    type = list(number)
    default = [22,80,443]
}

variable "egressrules" {
    type = list(number)
    default = [22,80,443]
}

variable sgname {
    type = string
    default = "enter sgt name from web.tf"
}

variable sgdesc {
    type = string
    default = "enter description from web.tf"
}
output "sgname" {
    # value = aws_security_group.webtraffic.name  <-- this also works
    value = var.sgname
}

resource "aws_security_group" "webtraffic" {
  
    # name = "Allow Web Traffic name from sg/sg.tf" 
    name = var.sgname
    description = var.sgdesc
    dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }   
    }
    dynamic "egress" {
    iterator = port
    for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }   
    }
}

# output "sg_name" {
#     value = aws_security_group.webtraffic.name
# }
