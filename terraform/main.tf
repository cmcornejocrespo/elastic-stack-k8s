resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location_extended

  tags = {
    description = "elastic demo aks rg"
  }
}

resource "azurerm_kubernetes_cluster" "elastic-aks" {
  location            = var.location
  name                = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = azurerm_resource_group.rg.name

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.aks_agent_size
    os_disk_size_gb = var.os_size
  }

  addon_profile {

    azure_policy {
      enabled = false
    }

    kube_dashboard {
      enabled = true
    }

  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = var.aks_rbac_enabled
  }

  tags = {
    description = "elastic demo aks cluster"
  }
}
