# Provider for AWS
provider "aws" {
  region = "us-east-2"
}

# If you prefer, you can store the Terraform state in S3
# https://www.terraform.io/docs/backends/types/s3.html
# terraform {
#   backend "s3" {
#     region = "us-east-2"
#   }
# }

# Add below your code