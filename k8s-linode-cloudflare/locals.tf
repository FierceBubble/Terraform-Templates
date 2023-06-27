locals {
  root_dir        = abspath(path.root)
  k8s_config_dir  = "${local.root_dir}/.kube"
  k8s_config_file = "${local.k8s_config_dir}/kubeconfig.yaml"
  linode_ids      = linode_lke_cluster.tf-k8s-cluster.pool[0].nodes[*].instance_id
}
