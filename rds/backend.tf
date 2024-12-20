terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 4.0"
#     }
#   }
    backend "s3"{
        key = "terraform/tfstate.tfstate"
        bucket = "kraken-remote-backup"
        region = "us-west-2"
        #  Do not do this in real world... you can leave blank to gert prompted for input
        #a ccess_key = " "
        #s ecret_key = " "
      }
}