variable "instance_id" {
    type = string
    description = "The name of the Elastic IP"
    default = "enter instance id from the calling module"
}

variable "eip_name" {
    type = string
    default = "enter eip name from the calling module"
}
resource "aws_eip" "web_ip" {
    instance = var.instance_id
    tags = {
      Name = var.eip_name
    }

}
output "PublicIP" {
    value = aws_eip.web_ip.public_ip
}