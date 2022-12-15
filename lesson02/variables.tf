variable "server_port" {
  description = "instance port"
  type = number
  default = 8080
}

variable "instance_type" {
  description = "type instance"
  type = string
  default = "t2.micro"
}

variable "ubuntu_ami" {
  description = "id ami"
  type = string
  default = "ami-08c40ec9ead489470"
}