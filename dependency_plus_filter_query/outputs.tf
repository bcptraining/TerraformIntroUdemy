output "dbservers" {
    value = data.aws_instance.dbsearch.arn
 }

 output "db_instanceid" {  
    value = module.dbserver.db_instanceid

}