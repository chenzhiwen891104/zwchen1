output "kubeconfig_raw" {
  description = "Kubeconfig文件"
  value       = huaweicloud_cce_cluster.zwchen-cce.kube_config_raw
  sensitive   = true
}

