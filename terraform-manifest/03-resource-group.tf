resource "azurerm_resource_group" "aks-resource-group" {
  name     = "${var.resource-group-name}-${var.environment}"
  location = var.location
  
}