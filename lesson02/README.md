
# Lesson 02

In this Lesson we'll learn about the creation a service in AWS with Load balancer:

- Creation load balancer service with EC2
- My Second deploy in AWS
<details>
  <summary>Solution</summary>
  
  ```tf
    provider "aws" {
      region = "us-east-1"
    }

    resource "aws_default_subnet" "default_az1" {
        availability_zone = "us-east-1a"

        tags = {
          Name = "Default subnet for us-east-1a"
        }
    }

    resource "aws_instance" "myServer" {
      ami                    = var.ubuntu_ami
      instance_type          = var.instance_type
      subnet_id = aws_default_subnet.default_az1.id
      vpc_security_group_ids = [aws_security_group.my_security_group.id]
      user_data              = <<-EOF
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
        from_port   = var.server_port
        to_port     = var.server_port
        protocol    = "TCP"
      }
    }
  ```
</details>

![Diagram final infrastructure created](https://github.com/wizelineacademy/terraform-academy/blob/master/lesson02/Lesson02_Diagram.png)