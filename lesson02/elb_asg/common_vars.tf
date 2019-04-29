variable "aws_region" {
  default = "us-east-1"
}

variable "metadata" {
  default = {
    appname    = "sample-app"
    appversion = "latest"
  }
}

variable "env" {
  description = "string for the enviroment, allowed values develop, uat, prod"
  default     = "develop"
}

variable "tags" {
  type = "map"

  default = {
    Name     = "sample-app"
    owner    = "carlos.castro@wizeline.com"
    bu       = "app"
    product  = "manager"
    preserve = "true"
    appid    = "sample-app-webapp"
  }
}
