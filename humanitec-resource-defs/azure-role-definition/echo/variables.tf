variable "prefix" {
  description = "Specifies the prefix used in default name for created resources."
  type        = string
  default     = "hum-rp-service-bus-ex-"
}

variable "role_definition_id" {
  description = "The Azure Resource Manager ID"
  type        = string
}

variable "role_definition_scope" {
  description = "The scope at which the Role Definition applies to"
  type        = string
}