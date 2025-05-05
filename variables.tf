variable "rg_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "ssh_public_key" {
  type        = string
  description = "Path to SSH public key"
}