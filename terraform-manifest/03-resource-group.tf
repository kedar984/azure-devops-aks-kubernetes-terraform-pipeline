resource "azurerm_resource_group" "aks-resource-group" {
  name     = var.resource-group-name
  location = var.location
  tags = {
    environment = "Terraform"
  }
}