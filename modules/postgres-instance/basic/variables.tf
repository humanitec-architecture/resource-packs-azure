
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

variable "res_id" {
  type = string
}

variable "app_id" {
  type = string
}

variable "env_id" {
  type = string
}

variable "name" {
  description = "Specifies the Name for created resources. (Leave empty for the default one)"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Specifies the prefix used in default name for created resources."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which created resources will reside."
  type        = string
}

variable "administrator_login" {
  description = "The Administrator login for the PostgreSQL Server."
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server."
  type        = string
}

variable "postgres_version" {
  description = "Specifies the version of PostgreSQL to use."
  type        = string
}

variable "storage_mb" {
  description = "Max storage allowed for a server."
  type        = number
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off."
  type        = bool
}

variable "auto_grow_enabled" {
  description = "Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only."
  type        = bool
}

variable "virtual_network_name" {
  description = "The name of the virtual network where Private Endpoint will be allocated."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."
  type        = string
}

# variable "private_dns_zone_id" {
#   description = "The ID of the Private DNS Zone which should be used."
#   type        = string
# }

variable "workload_resource_group_name" {
  description = "Specifies the Name of the Resource Group within which created resources will reside."
  type        = string
}
