# - - -- - Digital Ocean Variables - - - - - #
variable "digitalocean_token" {
  sensitive = true
}

# Droplet
variable "do_droplet_name" {}
variable "do_droplet_image" {}
variable "do_droplet_region" {}
variable "do_droplet_size" {}
