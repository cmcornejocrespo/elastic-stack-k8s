terraform {
  backend "azurerm" {
    storage_account_name  = "tstateakspets16479"
    container_name        = "tstate-aks-pets"
    key                   = "terraform.tfstate"
  }
}