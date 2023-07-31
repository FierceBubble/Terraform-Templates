variable "do_droplet_ids" {
  type = list(string)
}

variable "do_monitor_alerts" {
  type = list(object({
    email       = list(string)
    channel     = string
    url         = string
    window      = string
    type        = string
    compare     = string
    value       = number
    enabled     = bool
    description = string
  }))
}
