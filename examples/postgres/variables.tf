variable "prefix" {
  description = "Prefix of the created resources"
  type        = string
  default     = "hum-rp-postgres-ex-"
}

variable "name" {
  description = "Name of the example application."
  type        = string
  default     = "hum-rp-postgres-example"
}

variable "resource_packs_azure_url" {
  description = "Azure Resource Pack git url."
  type        = string
  default     = "https://github.com/humanitec-architecture/resource-packs-azure.git"
}

variable "resource_packs_azure_rev" {
  description = "Azure Resource Pack git branch."
  type        = string
  default     = "refs/heads/main"
}

variable "client_id" {
  description = "The Client ID which should be used."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret which should be used."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID which should be used."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID which should be used."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which this database will reside."
  type        = string
}

variable "administrator_login" {
  description = "The Administrator login for the PostgreSQL Server."
  type        = string
}

variable "administrator_login_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network where Private Endpoint will be allocated."
  type        = string
}

variable "virtual_network_resource_group_name" {
  description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."
  type        = string
}
