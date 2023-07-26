# - - - - - AWS Variables - - - - - #
variable "aws_access_key" {
  sensitive = true
}
variable "aws_secret_key" {
  sensitive = true
}

# - - - - - Azure Variables - - - - - #
variable "azure_subscription_id" {
  sensitive = true
}
variable "azure_tenant_id" {
  sensitive = true
}

# - - -- - Civo Variables - - - - - #
variable "civo_token" {
  sensitive = true
}

# - - -- - Digital Ocean Variables - - - - - #
variable "digitalocean_token" {
  sensitive = true
}

# - - -- - Google Variables - - - - - #


# - - -- - Hetzner Variables - - - - - #


# - - -- - Linode Variables - - - - - #
variable "linode_token" {
  sensitive = true
}

# - - -- - UpCloud Variables - - - - - #
variable "upcloud_username" {}
variable "upcloud_password" {
  sensitive = true
}

# - - -- - Vultr Variables - - - - - #
variable "vultr_api_key" {
  sensitive = true
}
