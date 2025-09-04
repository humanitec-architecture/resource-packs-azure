variable "role_definition_ids" {
  type = any
}

variable "scopes" {
  type = any
}

variable "principal_id" {
  description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
}
