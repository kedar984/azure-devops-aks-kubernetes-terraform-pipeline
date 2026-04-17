resource "azurerm_kubernetes_cluster_node_pool" "linux-node-pool02" {
  name                  = "linuxnode02"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-cluster.id
  vm_size               = "Standard_D2_v3"
  vnet_subnet_id      =  azurerm_subnet.aks-subnet.id
  min_count = 1
  max_count = 3
    auto_scaling_enabled = true
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    os_type = "Linux"
    os_sku = "Ubuntu"
    os_disk_size_gb = 40
    mode = "User"
  priority = "Regular"
    node_labels = {
      "nodepool-type" = "linux"
      "environment"   = "dev"
      "nodepools"     = "linuxapps"
      "app"           = "linux-apps"
      "ui-app"        = "reactjs-apps"
    }
upgrade_settings {
  max_surge = "10%"
}
  tags = {
    Environment = "dev"
  }
}