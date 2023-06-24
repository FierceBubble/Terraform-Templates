variable "linode_root_password" {}

resource "linode_instance" "server" {
  label            = "terraform_test_instance"
  image            = "linode/ubuntu22.04"
  region           = "ap-south"
  type             = "g6-standard-1"
  authorized_users = ["fiercebubble"]
  root_pass        = var.linode_root_password

  group      = "terraform"
  tags       = ["tfo"]
  swap_size  = 256
  private_ip = true
}
