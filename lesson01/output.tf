# Uncomment this when you have the solution

# output "web_ip" {
#   value = aws_instance.web.public_ip
# }

# output "web_dns" {
#   value = aws_instance.web.public_dns
# }

# Only uncomment if you have a hosted zone in Route53
# output "web_dns" {
#   value = aws_route53_record.dns_web.name
# }

output "dns_publica_servidor1" {
  description = "DNS public server"
  value = "http://${aws_instance.myServer.public_dns}:${var.server_port}"
}
