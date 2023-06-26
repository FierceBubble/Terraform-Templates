locals {
  linode_ids = linode_lke_cluster.tf-k8s-cluster.pool[0].nodes[*].instance_id
}

resource "linode_lke_cluster" "tf-k8s-cluster" {
  label       = "tf-k8s-cluster"
  k8s_version = var.k8s_version
  region      = var.region
  tags        = var.tags

  pool {
    type  = var.type
    count = var.linode_count

    autoscaler {
      min = var.linode_count
      max = 10
    }
  }

  # Prevent the count field from overriding autoscaler-created nodes
  lifecycle {
    ignore_changes = [
      pool.0.count
    ]
  }
}

module "firewall_web" {
  source         = "./modules/web_server"
  firewall_label = var.firewall_label_map["web"]
  tags           = var.tags
  linodes        = local.linode_ids
}
