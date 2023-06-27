variable "cloudflare_api_key" {
  description = "Cloudflare API Key"
}
variable "cloudflare_email" {
  description = "Cloudflare Email"
}

variable "linode_token" {
  description = " Linode API token"
}

variable "k8s_version" {
  description = "Kubernetes Version"
  default     = "1.26"
}

variable "linode_count" {
  description = "The number of Linode instances to deploy."
  type        = number
  default     = 3
}

variable "image" {
  description = "Image to use for Linode instance."
  default     = "linode/ubuntu22.04"
}

variable "label" {
  description = "The Linode's label is for display purposes only, but must be unique."
  default     = "default-linode"
}

variable "region" {
  description = "The region where your Linode will be located."
  default     = "ap-south"
}

variable "type" {
  description = "Your Linode's plan type."
  default     = "g6-standard-1"
}

variable "linode_root_password" {
  description = "Your Linode's root user's password."
}

variable "linodes" {
  description = "List of Linode ids to which the rule sets will be applied"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "List of tags to apply to this Firewall"
  type        = list(string)
  default     = ["tf-k8s"]
}

variable "firewall_label_map" {
  type = map(string)
  default = {
    "web"   = "k8s_firewall_web_server"
    "mysql" = "k8s_firewall_mysql"
    "ssh"   = "k8s_firewall_ssh"
  }
}
