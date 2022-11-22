output "dns_publica_servidor1" {
  description = "Server public DNS"
  value = "http://${aws_instance.server1.public_dns}:${var.server_port}"
}

output "dns_publica_servidor2" {
  description = "Server public DNS"
  value = "http://${aws_instance.server2.public_dns}:${var.server_port}"
}

output "dns_load_balancer" {
  description = "DNS Load balancer"
  value = "http://${aws_lb.alb.dns_name}:${var.lb_port}"
}

