data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.aks-resource-group.location
  include_preview = false
}