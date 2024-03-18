variable "subscription_id" {
  description = "The Subscription ID which should be used."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which created resources will reside."
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
  default     = "hum-rp-blob-storage-ex-"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "GRS"
}

variable "container_name" {
  description = "The name of the Container which should be created within the Storage Account."
  type        = string
}

variable "container_access_type" {
  description = "The Access Level configured for this Container."
  type        = string
  default     = "private"
}
