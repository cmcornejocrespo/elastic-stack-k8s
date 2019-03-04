resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location_extended}"

  tags {
    projectid   = "ISBN-0067"
    description = "ISBAN PETS AKS"
  }
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "${var.resource_group_name}-law-${random_id.workspace.hex}"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku                 = "PerGB2018"

  tags {
    projectid   = "ISBN-0067"
    description = "ISBAN PETS AKS"
  }
}

resource "azurerm_log_analytics_solution" "las" {
  solution_name         = "ContainerInsights"
  location              = "${azurerm_resource_group.rg.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.law.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.law.name}"

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }

}

resource "azurerm_kubernetes_cluster" "aks-pets" {
  location            = "${var.location}"
  name                = "${azurerm_resource_group.rg.name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix          = "${azurerm_resource_group.rg.name}"

  agent_pool_profile {
    name            = "default"
    count           = "${var.node_count}"
    vm_size         = "${var.aks_agent_size}"
    os_disk_size_gb = "${var.os_size}"
  }

  kubernetes_version = "${var.kubernetes_version}"

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  role_based_access_control {
    enabled = "${var.aks_rbac_enabled}"
  }

  addon_profile {
    oms_agent {
      enabled                    = "${var.oms_enabled}"
      log_analytics_workspace_id = "${azurerm_log_analytics_workspace.law.id}"
    }
  }

  tags {
    projectid   = "ISBN-0067"
    description = "ISBAN PETS AKS"
  }
}

resource "random_id" "workspace" {
  keepers = {
    # Generate a new id each time we switch to a new resource group
    group_name = "${azurerm_resource_group.rg.name}"
  }

  byte_length = 8
}