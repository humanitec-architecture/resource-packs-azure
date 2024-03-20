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
  default     = "hum-rp-blob-storage-ex-"
}

variable "storage_account_name" {
  description = "The Name of the Storage Account which should be used for the Container."
  type        = string
}

variable "container_access_type" {
  description = "The Access Level configured for this Container."
  type        = string
  default     = "private"
}
