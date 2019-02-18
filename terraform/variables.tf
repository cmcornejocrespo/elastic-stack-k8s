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

variable "vm_size" {
  default = "Standard_B2s"
#   Standard_E2s_v3
}

variable "os_size" {
  default = "30"
}

variable "client_secret" {}
variable "client_id" {}



