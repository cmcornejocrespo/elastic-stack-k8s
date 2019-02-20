variable "resource_group_name" {
  default = "aks-pets"
}

variable "location" {
  default = "ukwest"
}

variable "location_extended" {
  default = "UK West"
}

variable "node_count" {
  default = "1"
}

variable "aks_agent_size" {
  # default = "Standard_B2s"
  default = "Standard_B4ms"
}

variable "os_size" {
  default = "30"
}

variable "kubernetes_version" {
  default = "1.12.5"
}

variable "client_secret" {}
variable "client_id" {}