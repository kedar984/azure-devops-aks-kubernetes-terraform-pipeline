output "resource-group_name" {
  value = azurerm_resource_group.aks-resource-group.name
}
output "location" {
  value = azurerm_resource_group.aks-resource-group.location
}
output "log-analyitics-workspace" {
  value = azurerm_log_analytics_workspace.aks-log-analytics-workspace.name
}
output "azuread-group-name" {
  value = data.azuread_group.azure-ad-group-object-id.display_name
}
output "azuread-group-object-id" {
  value = data.azuread_group.azure-ad-group-object-id.object_id
}
output "aks-cluster-name" {
  value = azurerm_kubernetes_cluster.aks-cluster.name
}
output "versions" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}
output "kubernetes-cluster-latest-version" {
  value = azurerm_kubernetes_cluster.aks-cluster.kubernetes_version
}
output "latest_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}
output "linux-node-pool-name" {
  value = azurerm_kubernetes_cluster_node_pool.linux-node-pool.name
}
output "windows-node-pool-name" {
  value = azurerm_kubernetes_cluster_node_pool.windows-node-pool.name
}
output "storage-account-name" {
  value = data.azurerm_storage_account.storage-account.name
}
output "storage-account-tier" {
  value = data.azurerm_storage_account.storage-account.account_tier
}