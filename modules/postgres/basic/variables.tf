
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

variable "database_name" {
  description = "Specifies the name for the created database"
  type        = string
  default     = ""
}

variable "server_id" {
  description = "The ID of the Azure PostgreSQL Flexible Server from which to create this PostgreSQL Flexible Server Database"
  type        = string
}

variable "host" {
  description = "The private IP address of the PostgreSQL Flexible Server Database"
  type        = string
}

variable "administrator_login" {
  description = "The Administrator login for the PostgreSQL Flexible Server."
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Flexible Server."
  type        = string
}
