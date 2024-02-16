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
  default     = "hum-rp-mysql-ex-"
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
