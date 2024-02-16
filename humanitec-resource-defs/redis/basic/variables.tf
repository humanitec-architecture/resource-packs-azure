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

variable "name" {
  description = "Specifies the Name for created resources. (Leave empty for the default one)"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Specifies the prefix used in default name for created resources."
  type        = string
  default     = "hum-rp-mysql-ex-"
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which this database will reside."
  type        = string
}

variable "capacity" {
  description = "The size of the Redis cache to deploy."
  type        = number
  default     = 2
}

variable "family" {
  description = "The SKU family/pricing group to use."
  type        = string
  default     = "C"
}

variable "sku_name" {
  description = "The SKU of Redis to use."
  type        = string
  default     = "Standard"
}

variable "enable_non_ssl_port" {
  description = "Enable the non-SSL port"
  type        = bool
  default     = false
}

variable "minimum_tls_version" {
  description = "The minimum TLS version."
  type        = string
  default     = "1.2"
}
