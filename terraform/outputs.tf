output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.host
}
