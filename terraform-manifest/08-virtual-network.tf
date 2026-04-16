resource "azurerm_virtual_network" "aks-vnet" {
  name                = "${azurerm_resource_group.aks-resource-group.name}-vnet"
  location            = azurerm_resource_group.aks-resource-group.location
  resource_group_name = azurerm_resource_group.aks-resource-group.name
  address_space       = ["10.0.0.0/8"]
}


resource "azurerm_subnet" "aks-subnet" {
  name                 = "${azurerm_resource_group.aks-resource-group.name}-subnet"
  resource_group_name  = azurerm_resource_group.aks-resource-group.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = ["10.5.0.0/16"]
}