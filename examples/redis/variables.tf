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

variable "prefix" {
  description = "Prefix of the created resources"
  type        = string
  default     = "hum-rp-redis-ex-"
}

variable "name" {
  description = "Specifies the Name for created application."
  type        = string
  default     = "hum-rp-redis-example"
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which this database will reside."
  type        = string
}
