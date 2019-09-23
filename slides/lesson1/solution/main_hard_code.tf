# Configure AWS Cloud provider
provider "aws" {
  region = "us-east-2"
}


resource "aws_default_vpc" "default" {
  tags = {
    Terraform  = true
    Service    = "web"
    Customer   = "Stark Industries"
    Owner      = "Wizeline"
    Maintainer = "devops@wizeline.com"
  }
}

resource "aws_security_group" "web" {
  name        = "${data.aws_caller_identity.current.user_id}-web"
  description = "Allow web traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_instance" "web" {
  ami           = "ami-02bcbb802e03574ba"
  instance_type = "m4.large"
  key_name      = var.instance_key

  provisioner "local-exec" {
    command = "bash -c 'MAX=10; C=0; until curl -s -o /dev/null ${aws_instance.web.public_dns}; do [ $C -eq $MAX ] && { exit 1; } || sleep 10; ((C++)); done;' || false"
  }

  user_data = data.template_file.user_data.rendered

  vpc_security_group_ids = [aws_security_group.web.id]

  tags = merge(
    var.tags,
    {
      "Name" = format("%s-%s", data.aws_caller_identity.current.user_id, "ec2")
    },
  )
}

# Uncomment this if you have a hosted zone in your AWS account
# resource "aws_route53_record" "dns_web" {
#   zone_id = "${data.aws_route53_zone.current.zone_id}"
#   name    = "${data.aws_caller_identity.current.user_id}.academy.wizeline.dev"
#   type    = "A"
#   ttl     = 300
#   records = ["${aws_instance.web.public_ip}"]
# }
