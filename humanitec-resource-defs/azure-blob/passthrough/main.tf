resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/template"
  id          = "${var.prefix}blob-storage-${var.blob_storage_resource_class}-${var.policy_resource_class}"
  name        = "${var.prefix}blob-storage-${var.blob_storage_resource_class}-${var.policy_resource_class}"
  type        = "azure-blob"

  driver_inputs = {
    values_string = jsonencode({
      templates = {
        outputs = <<EOL
account: "$${resources['azure-blob.${var.blob_storage_resource_class}'].outputs.account}"
container: "$${resources['azure-blob.${var.blob_storage_resource_class}'].outputs.container}"
EOL
      }
    })
  }

  provision = {
    "azure-role-definition.${var.policy_resource_class}" = {
      match_dependents = true
      is_dependent     = false
    }
  }
}
