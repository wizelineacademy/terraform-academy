variable "server_port" {
  description = "instance port"
  type = number
  default = 8080
}

variable "lb_port" {
  description = "port load balancer"
  type = number
  default = 80
}

variable "instance_type" {
  description = "type instance"
  type = string
  default = "t2.micro"
}

variable "ubuntu_ami" {
  description = "id ami"
  type = map(string)

  default = {
      eu-east-1a = "ami-08c40ec9ead489470"
      eu-east-1b = "ami-08c40ec9ead489470"
  }
}