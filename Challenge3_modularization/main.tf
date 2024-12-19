/* This script is an example of breaking down a monolithic script (one big main.tf from Challenge 2) into reusable modules
What gets built?
1. a security group which allows web traffic
2. A DB Server 
3. A Web server which allows web traffic (using the security group)
4. An elastic ip asigned to the web server */
provider "aws" {
    region = "us-west-2"
}

# create dbserver
module "dbservermodule" {
    source = "./db"
    dbservername = "DB Server name from module"    
}

# create webserver
module "webservermodule" {
    source = "./web"
    # sg_name = "SG Name From Module"
    webservername = "webserver name from module in main.tf"     
}

output "DBPrivateIP" {
    value = module.dbservermodule.PrivateIP
}
output "WebPublicIp" {
    value = module.webservermodule.pub_ip
}


