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
  default     = ""
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
  type        = string
  default     = ""
}

variable "virtual_network_name" {
  description = "The name of the virtual network where Private Endpoint will be allocated."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet where the Private Endpoint will be allocated."
  type        = string
}

variable "workload_resource_group_name" {
  description = "The name of the resource group where the Private Endpoint will be allocated."
  type        = string
}
