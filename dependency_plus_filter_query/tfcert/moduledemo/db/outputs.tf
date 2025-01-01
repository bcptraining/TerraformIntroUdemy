output "dbinstanceid" {
    value = aws_instance.myec2db.id 
}

output "dbprivateip" {
    value = aws_instance.myec2db.private_ip
}