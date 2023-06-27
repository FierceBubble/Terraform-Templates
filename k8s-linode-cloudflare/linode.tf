resource "linode_lke_cluster" "tf-k8s-cluster" {
  label       = "tf-k8s-cluster"
  k8s_version = var.k8s_version
  region      = var.region
  tags        = var.tags

  pool {
    type  = var.type
    count = var.linode_count

    # Autoscale worker nodes
    autoscaler {
      min = 3
      max = 5
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

resource "local_file" "k8s_config" {
  content         = base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig)
  filename        = local.k8s_config_file
  file_permission = "0600"
}

# data "linode_nodebalancer" "traefik_loadbalancer" {
#   depends_on = [ helm_release.traefik ]

# }
