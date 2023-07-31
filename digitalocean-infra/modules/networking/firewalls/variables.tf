variable "droplet_ids" {
  type = list(string)
}

variable "inbound_rules" {
  type = list(object({
    protocol         = string
    port_range       = string
    source_addresses = list(string)
  }))
}

variable "outbound_rules" {
  type = list(object({
    protocol              = string
    port_range            = string
    destination_addresses = list(string)
  }))
}
