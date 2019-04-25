variable "resource_group_name" {
  default = "elastic-aks"
}

variable "location" {
  default = "westeurope"
}

variable "location_extended" {
  default = "West Europe"
}

variable "node_count" {
  default = "1"
}

variable "oms_enabled" {
  default = true
}

variable "aks_rbac_enabled" {
  default = true
}

variable "aks_agent_size" {
  # default = "Standard_B2s"
  default = "Standard_B4ms"
}

variable "os_size" {
  default = "30"
}

variable "kubernetes_version" {
  default = "1.13.5"
}

variable "client_secret" {}
variable "client_id" {}
