resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "${azurerm_resource_group.aks-resource-group.name}-cluster"
  location            = azurerm_resource_group.aks-resource-group.location
  resource_group_name = azurerm_resource_group.aks-resource-group.name
  dns_prefix          = "${azurerm_resource_group.aks-resource-group.name}-cluster"
  kubernetes_version  =  data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks-resource-group.name}-nodes-rg"


  default_node_pool {
    name       = "systempool"
    vm_size    = "Standard_D2_v3"
    auto_scaling_enabled = true
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    os_sku = "Ubuntu"
    os_disk_size_gb = 40
    type = "VirtualMachineScaleSets"
    min_count = 1
    max_count = 3
    vnet_subnet_id      =  azurerm_subnet.aks-subnet.id
     node_labels = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepools"     = "systemapps"
      "app"           = "system-apps"
    }
     upgrade_settings {
      max_surge = "10%"
    }
    
    tags = {
      "nodepool-type" = "system"
      "environment"   = "dev"
      "nodepools"     = "systemapps"
      "app"           = "system-apps"
    }
  }

  identity {
    type = "SystemAssigned"
  }

azure_active_directory_role_based_access_control {
  admin_group_object_ids = [data.azuread_group.azure-ad-group-object-id.object_id]
  azure_rbac_enabled = true
}
oms_agent {
  log_analytics_workspace_id = azurerm_log_analytics_workspace.aks-log-analytics-workspace.id
}
  linux_profile {
    admin_username = "${var.linux_admin}"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }
  windows_profile {
    admin_username = var.window_admin_user
    admin_password = var.windows_admin_password
  }
network_profile {
  network_plugin = "azure"
  load_balancer_sku = "standard"
}
  tags = {
    Environment = "dev"
  }
}