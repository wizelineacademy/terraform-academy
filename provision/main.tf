variable "aws_region" {
  default = "us-east-2"
}

provider "aws" {
  profile = "interviews-provision"
  region  = "${var.aws_region}"
}

# terraform {
#   backend "s3" {
#     bucket = "bots-platform-terraform-config-2"
#     key    = "ark-iam/terraform.tfstate"
#     region = "us-east-2"
#   }
# }

# Sample usage for users module
module "users" {
  source = "./iam-users"

  aws_region      = "${var.aws_region}"
  total_users     = "5"
  tf_state_bucket = "beer-bucket"
}
