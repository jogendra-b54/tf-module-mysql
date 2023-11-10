 # Terraform Remote state Datasource : this is going to read the data from another statefile

 data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket = "b54-terraform-remote-state"
        key    = "vpc/${var.ENV}/terraform.tfstate"
        region = "us-east-1"
    }
   
 }



 data "aws_secretsmanager_secret" "secrets" {
   name = "robot/secrets"
 }


 data "aws_secretsmanager_secret_version" "secret_version" {
   secret_id     = data.aws_secretsmanager_secret.secrets.id 
 }