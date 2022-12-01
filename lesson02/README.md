
# Lesson 02

In this Lesson we'll learn about the creation a service in AWS with Load balancer:

- Creation load balancer service with EC2
- My Second deploy in AWS
    <details>
        <summary>Solution</summary>
        <table>
        <tr>
            <td><strong>main.tf</strong></td>
        </tr>
        <tr>
            <td>
                resource "aws_default_subnet" "default_az1" {
                    availability_zone = "us-east-1a"

                    tags = {
                        Name = "Default subnet for us-east-1a"
                    }
                }

                resource "aws_default_subnet" "default_az2" {
                    availability_zone = "us-east-1b"

                    tags = {
                        Name = "Default subnet for us-east-1b"
                    }
                }

                /************************************
                EC2 instance definition
                ************************************/

                resource "aws_instance" "server1" {
                    ami = var.ubuntu_ami["eu-east-1a"]
                    instance_type = var.instance_type
                    subnet_id = aws_default_subnet.default_az1.id
                    vpc_security_group_ids = [ aws_security_group.my_security_group.id ]
                    user_data = <<-EOF
                                #!/bin/bash
                                echo "Hi I'm Server1!" > index.html
                                nohup busybox httpd -f -p ${var.server_port} & 
                                EOF

                    tags = {
                    Name = "server-1"
                    }
                }


                resource "aws_instance" "server2" {
                    ami = var.ubuntu_ami["eu-east-1b"]
                    instance_type = var.instance_type
                        subnet_id = aws_default_subnet.default_az2.id
                    vpc_security_group_ids = [ aws_security_group.my_security_group.id ]
                    user_data = <<-EOF
                                #!/bin/bash
                                echo "Hi I'm Server2!" > index.html
                                nohup busybox httpd -f -p ${var.server_port} & 
                                EOF

                    tags = {
                    Name = "server-2"
                    }
                }

                resource "aws_security_group" "my_security_group" {
                name = "primer-servidor-sg"

                    ingress {
                        security_groups = [aws_security_group.alb.id]
                        description = "Web port access"
                        from_port = var.server_port
                        to_port = var.server_port
                        protocol = "TCP"
                    }
                }

                resource "aws_lb" "alb" {
                load_balancer_type = "application"
                name = "Terraform-alb"
                security_groups = [aws_security_group.alb.id]
                subnets = [ aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id ]
                }

                resource "aws_security_group" "alb" {
                name = "alb-sg"

                ingress {
                    cidr_blocks = [ "0.0.0.0/0" ]
                    description = "Access port 80"
                    from_port = var.lb_port
                    protocol = "TCP"
                    to_port = var.lb_port
                } 

                    egress {
                    cidr_blocks = [ "0.0.0.0/0" ]
                    description = "Access port 8080"
                    from_port = var.server_port
                    protocol = "TCP"
                    to_port = var.server_port
                    } 
                }

                data "aws_vpc" "default" {
                default = true
                }

                resource "aws_lb_target_group" "this" {
                name = "terraform-alb-target-group"
                port = var.lb_port
                vpc_id = data.aws_vpc.default.id
                protocol = "HTTP"

                    health_check {
                        enabled = true
                        matcher = "200"
                        path = "/"
                        port = "${var.server_port}"
                        protocol = "HTTP"
                    }
                }

                resource "aws_lb_target_group_attachment" "server1" {
                target_group_arn = aws_lb_target_group.this.arn
                target_id = aws_instance.server1.id
                port = var.server_port
                }

                resource "aws_lb_target_group_attachment" "server2" {
                target_group_arn = aws_lb_target_group.this.arn
                target_id = aws_instance.server2.id
                port = var.server_port
                }

                resource "aws_lb_listener" "this" {
                load_balancer_arn = aws_lb.alb.arn
                port = var.lb_port
                protocol = "HTTP"
                    default_action {
                        target_group_arn = aws_lb_target_group.this.arn
                        type = "forward"
                    }
                }       
    </details>

![Diagram final infrastructure created](https://github.com/wizelineacademy/terraform-academy/blob/master/lesson02/Lesson02_Diagram.png)