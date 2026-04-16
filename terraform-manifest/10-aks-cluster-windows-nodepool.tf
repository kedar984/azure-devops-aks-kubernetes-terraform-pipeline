resource "azurerm_kubernetes_cluster_node_pool" "windows-node-pool" {
  name                  = "wind01"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-cluster.id
  vm_size               = "Standard_D2_v3"
  vnet_subnet_id      =  azurerm_subnet.aks-subnet.id
  min_count = 1
  max_count = 3
    auto_scaling_enabled = true
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    os_type = "Windows"
    os_disk_size_gb = 256
    mode = "User"
    priority = "Regular"
    node_taints                   = []
    zones                         = []
    host_encryption_enabled       = false
    node_public_ip_enabled        = false
    node_labels = {
      "nodepool-type" = "windows"
      "environment"   = "dev"
      "nodepools"     = "DotNet-apps"
      "app"           = "DotNet-apps"
    }
    upgrade_settings {
  max_surge = "10%"
}
windows_profile { # forces replacement
          outbound_nat_enabled = true
        }
  tags = {
    Environment = "dev"
  }
}