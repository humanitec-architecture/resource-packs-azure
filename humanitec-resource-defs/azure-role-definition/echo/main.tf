resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/echo"
  id          = "${var.prefix}role-definition-echo"
  name        = "${var.prefix}role-definition-echo"
  type        = "azure-role-definition"

  driver_inputs = {
    values_string = jsonencode({
      id    = var.role_definition_id
      scope = var.role_definition_scope
    })
  }
}
