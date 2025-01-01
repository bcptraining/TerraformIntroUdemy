provider "aws" {
    region = "us-west-2"
}

variable    "username" {
    type = string
}
variable    "password" {
    type = string
}

provider "vault" {
    # address = "XXXXXXXXXXXXXXXXXXXXX"
    auth_login {
      path = auth/userpass/login/var.username
      parameters = {
        password=var.password
      }
    }
}

data "vault_generic_secret" "dbuser" {
    path = "secret/dbuser"
}

data "vault_generic_secret" "dbpassword" {
    path = "secret/dbpassword"
}

resource "aws_db_instance" "myRDS" {
    name = "myDB"
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.2.21"
    username =  data.vault_generic_secret.dbuser["value"]
    password = data.vault_generic_secret.dbpassword["value"]
}
resource "aws_vpc" "xxx" {
    cidr_block = "10.0.0.0/16"
    tags = {
        cert = "DEA-C01 changed"
    }
}

# output "vpc_id" {
#     value = aws_vpc.xxx.id
# }