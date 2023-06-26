variable "linodes" {
  description = "List of Linode ids to which the rule sets will be applied"
  type        = list(string)
  default     = []
}

variable "firewall_label" {
  description = "This firewall's human-readable firewall_label"
  type        = string
  default     = "my-firewall"
}

variable "tags" {
  description = "List of tags to apply to this Firewall"
  type        = list(string)
  default     = []
}

variable "addresses" {
  description = "A list of IP addresses, CIDR blocks, or 0.0.0.0/0 (to allow all) this rule applies to."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
