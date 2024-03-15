variable "name" {
  description = "Specifies the Name for created resources. (Leave empty for the default one)"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Specifies the prefix used in default name for created resources."
  type        = string
  default     = "hum-rp-postgres-ex-"
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

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server."
  type        = string
  default     = "B_Standard_B2s"
}

variable "postgres_version" {
  description = "Specifies the version of PostgreSQL to use."
  type        = string
  default     = "11"
}

variable "storage_mb" {
  description = "Max storage allowed for a server."
  type        = number
  default     = 65536
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off."
  type        = bool
  default     = true
}

variable "auto_grow_enabled" {
  description = "Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only."
  type        = bool
  default     = true
}

variable "virtual_network_name" {
  description = "The name of the virtual network where Private Endpoint will be allocated."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."
  type        = string
}

variable "workload_resource_group_name" {
  description = "The ID of the Application which should be used."
  type        = string
}
