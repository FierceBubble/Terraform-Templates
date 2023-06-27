output "kubeconfig" {
  value     = linode_lke_cluster.tf-k8s-cluster.kubeconfig
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.tf-k8s-cluster.api_endpoints
}

output "status" {
  value = linode_lke_cluster.tf-k8s-cluster.status
}

output "id" {
  value = linode_lke_cluster.tf-k8s-cluster.id
}

output "pool" {
  value = linode_lke_cluster.tf-k8s-cluster.pool
}

output "linode_id" {
  value = linode_lke_cluster.tf-k8s-cluster.pool[0].nodes[*].instance_id
}

# output "cluster_ca_certificate" {
#   value = yamldecode(nonsensitive(base64decode(linode_lke_cluster.tf-k8s-cluster.kubeconfig))).clusters.0.cluster.certificate-authority-data
# }
