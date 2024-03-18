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

variable "name" {
  description = "Specifies the Name for created resources. (Leave empty for the default one)"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Specifies the prefix used in default name for created resources."
  type        = string
  default     = "hum-rp-service-bus-ex-"
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which created resources will reside."
  type        = string
}

variable "audience" {
  description = "Specifies the audience for this Federated Identity Credential."
  type        = set(string)
}

variable "issuer" {
  description = "Specifies the issuer of this Federated Identity Credential."
  type        = string
}

variable "parent_id" {
  description = "Specifies parent ID of User Assigned Identity for this Federated Identity Credential."
  type        = string
}

variable "subject" {
  description = "Specifies the subject for this Federated Identity Credential."
  type        = string
}
