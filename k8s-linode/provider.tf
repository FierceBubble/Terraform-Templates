terraform {
  required_version = ">= 0.13.0"
  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 1.16.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.8.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }

  # Put .tfstate into a s3 cloud storage instead of a local
  backend "s3" {}
}

provider "linode" {
  token = var.linode_token
}

# provider "helm" {
#   kubernetes {
#     config_path = local.k8s_config_file
#     # host = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.server
#     # client_certificate     = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.client-certificate-data
#     # client_key             = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.client-key-data
#     # cluster_ca_certificate = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.certificate-authority-data
#     # token                  = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.token
#   }
# }

# provider "kubectl" {
#   # config_context = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig)))
#   host = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.server
#   # client_certificate     = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.client-certificate-data
#   # client_key             = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.client-key-data
#   cluster_ca_certificate = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.certificate-authority-data
#   token                  = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.token
#   load_config_file       = false
# }

# provider "kubernetes" {
#   config_path = local.k8s_config_file
#   # host = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.server
#   # client_certificate     = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.client-certificate-data
#   # client_key             = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.client-key-data
#   # cluster_ca_certificate = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.certificate-authority-data
#   # token                  = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).users.0.user.token
# }

provider "cloudflare" {
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email
}
