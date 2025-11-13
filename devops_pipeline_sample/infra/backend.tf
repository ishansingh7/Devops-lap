# Terraform backend configuration - edit values before use
terraform {
  backend "s3" {
    bucket = "REPLACE_WITH_S3_BUCKET"
    key    = "devops-sample/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "REPLACE_WITH_DYNAMODB_TABLE" # optional
  }
}
