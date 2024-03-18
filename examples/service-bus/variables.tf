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
  default     = "hum-rp-service-bus-example"
}

variable "prefix" {
  description = "Specifies the prefix used in default name for created resources."
  type        = string
  default     = "hum-rp-service-bus-ex-"
}

variable "sku" {
  description = "Defines which tier to use."
  type        = string
  default     = "Standard"
}

variable "aks_cluster_issuer_url" {
  description = "AKS OIDC Issuer URL"
  type        = string
}
