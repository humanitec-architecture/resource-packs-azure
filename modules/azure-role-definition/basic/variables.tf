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

variable "scope" {
  description = "The scope at which the Role Definition applies to."
  type        = string
  default     = ""
}

variable "actions" {
  description = "One or more Allowed Actions."
  type        = set(string)
}

variable "data_actions" {
  description = "One or more Allowed Data Actions."
  type        = set(string)
}
