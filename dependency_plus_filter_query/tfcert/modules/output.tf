#Example getting the output from a module
output "db_instanceid" {  
    value = module.dbserver.db_instanceid

}

# Tip: when using a data source, remember to use the "data" prefix
output "EC2Ssearch_ids" {
    value = data.aws_instances.EC2Search.ids
 
}



