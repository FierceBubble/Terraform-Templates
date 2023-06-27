# variable "cloudflare_zone_id" {}

# resource "cloudflare_record" "server" {
#   zone_id = var.cloudflare_zone_id
#   name    = "terraform-linode.bubble-node.net"
#   value   = linode_instance.server.ip_address
#   type    = "A"
#   proxied = false
# }
