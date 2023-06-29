locals {
  root_dir        = abspath(path.root)
  k8s_config_dir  = "${local.root_dir}/.kube"
  k8s_config_file = "${local.k8s_config_dir}/kubeconfig.yaml"
  public_key_dir  = "/Users/fiercebubble/.ssh/azure_key.pub"
}
