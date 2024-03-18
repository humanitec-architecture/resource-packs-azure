variable "prefix" {
  description = "Prefix for all resources."
  type        = string
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

variable "append_logs_to_error" {
  description = "Append Terraform logs to error messages."
  type        = bool
  default     = false
}

variable "driver_account" {
  description = "The ID of the Resource Account which should be used."
  type        = string
}

variable "subscription_id" {
  description = "The Subscription ID which should be used."
  type        = string
}

variable "dns_zone" {
  description = "The id of the hosted zone in which this record set will reside."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which this dns will reside."
  type        = string
}
