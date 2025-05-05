variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "admin_username" {
  type        = string
  description = "SQL admin username"
}

variable "admin_password" {
  type        = string
  description = "SQL admin password"
  sensitive   = true
}