terraform {
  required_version = ">= 0.13.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.29.0"
    }
  }
}

resource "digitalocean_monitor_alert" "alerts" {
  for_each = { for each in var.do_monitor_alerts : each.type => each }
  alerts {
    email = each.value.email
    slack {
      channel = each.value.channel
      url     = each.value.url
    }
  }
  window      = each.value.window
  type        = each.value.type
  compare     = each.value.compare
  value       = each.value.value
  enabled     = each.value.enabled
  entities    = var.do_droplet_ids
  description = each.value.description
}
