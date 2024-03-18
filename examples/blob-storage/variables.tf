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
  description = "Specifies the Name of the Resource Group within which created resources will reside."
  type        = string
}

variable "name" {
  description = "Specifies the Name for created example application."
  type        = string
  default     = "hum-rp-blob-storage-example"
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
  default     = "hum-rp-blob-storage-example"
}

variable "container_access_type" {
  description = "The Access Level configured for this Container."
  type        = string
  default     = "private"
}

variable "aks_cluster_issuer_url" {
  description = "AKS OIDC Issuer URL"
  type        = string
}
