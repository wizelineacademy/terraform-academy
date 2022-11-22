output "dns_publica_servidor1" {
  description = "DNS public server"
  value = "http://${aws_instance.myServer.public_dns}:${var.server_port}"
}
