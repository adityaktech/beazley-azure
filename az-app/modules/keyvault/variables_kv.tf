variable "rg_name" {
  type        = string
  description = "Azure Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID of the Azure AD"
}

variable "admin_object_id" {
  type        = string
  description = "Object ID of the Azure AD user"
}

variable "secret_value" {
  type        = string
  sensitive   = true
  description = "Secret value to store"
}