
# Lesson 01

In this Lesson we'll learn about the principal commands of terraform:

- Providers
- Resources 
- Variables
- Output
- Principal commands:
    * terraform validate
    * terraform plan
    * terraform apply
    * terraform destroy
- My first deploy in AWS
    <details>
        <summary>Solution</summary>
        <table>
        <tr>
            <td><strong>main.tf</strong></td>
        </tr>
        <tr>
            <td>
                provider "aws" {
                    region = "us-east-1"
                }

                resource "aws_instance" "myServer" {
                    ami = var.ubuntu_ami
                    instance_type = var.instance_type
                    vpc_security_group_ids = [ aws_security_group.my_security_group.id ]
                    user_data = <<-EOF
                                #!/bin/bash
                                echo "Hello world!" > index.html
                                nohup busybox httpd -f -p ${var.server_port} & 
                                EOF
                }

                resource "aws_security_group" "my_security_group" {
                    name = "first-server-sg"

                    ingress {
                        cidr_blocks = ["0.0.0.0/0"]
                        description = "Web port"
                        from_port = var.server_port
                        to_port = var.server_port
                        protocol = "TCP"
                    }
                }          
    </details>
