variable "cloudflare_zone_id" {}

resource "cloudflare_record" "server" {
  zone_id = var.cloudflare_zone_id
  name    = "terraform-aws.bubble-node.net"
  value   = aws_instance.server.public_ip
  type    = "A"
  proxied = false
}
