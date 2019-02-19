provider "azurerm" {
  version = "=1.22.0"
}

terraform {
  backend "azurerm" {
    storage_account_name  = "tstateakspets16479"
    container_name        = "tstate-aks-pets"
    key                   = "terraform.tfstate"
  }
}

# Create a resource group
resource "azurerm_resource_group" "aks-pets-rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location_extended}"
}

resource "azurerm_kubernetes_cluster" "aks-pets" {
  name                = "${azurerm_resource_group.aks-pets-rg.name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.aks-pets-rg.name}"
  dns_prefix          = "${azurerm_resource_group.aks-pets-rg.name}"

  agent_pool_profile {
    name            = "default"
    count           = "${var.node_count}"
    vm_size         = "${var.vm_size}"
    os_disk_size_gb = "${var.os_size}"
  }

  kubernetes_version = "${var.kubernetes_version}"
  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  role_based_access_control {
    enabled = true
  }

  tags {
    ProjectId = "ISBN-0067"
    Description = "ISBAN PETS AKS"
  }
}