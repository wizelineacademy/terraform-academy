variable "aws-region" {
  default = "us-east-1"
}

variable "metadata" {
    default = {
    appname = "sample-app"
    appversion = "latest"
  }  
}


variable "env" {
   description = "string for the enviroment, allowed values develop, uat, prod"
   default= "develop"
}


variable "vpc_id" {
  default = {
    develop = "vpc-8b73c9ef"
  }  
}

variable "tags" {
  type = "map"

  default = {
    Name        = "sample-app"
    owner       = "carlos.castro@wizeline.com"
    bu          = "app"
    product     = "manager"
    preserve    = "true"
    appid       = "sample-app-webapp"
  }
}
