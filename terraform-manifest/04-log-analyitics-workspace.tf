resource "azurerm_log_analytics_workspace" "aks-log-analytics-workspace" {
  name                = "${var.environment}-${azurerm_resource_group.aks-resource-group.name}-${random_pet.random.id}-law"
  location            = azurerm_resource_group.aks-resource-group.location
  resource_group_name = azurerm_resource_group.aks-resource-group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}