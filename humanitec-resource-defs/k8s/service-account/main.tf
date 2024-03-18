resource "humanitec_resource_definition" "main" {
  id   = "${var.prefix}k8s-service-account"
  name = "${var.prefix}k8s-service-account"
  type = "k8s-service-account"

  driver_type = "humanitec/template"
  driver_inputs = {
    values_string = jsonencode({
      templates = {
        # cookie    = ""
        init      = ""
        manifests = <<EOL
serviceaccount.yaml:
  data:
    apiVersion: v1
    kind: ServiceAccount
    metadata:
      name: $${resources['azure-managed-identity'].outputs.principal_id}
      annotations:
        azure.workload.identity/client-id: $${resources['azure-managed-identity'].outputs.client_id}
        context: {{trimPrefix "modules." "$${context.res.id}"}}
        res: $${context.res.id}
        app: $${context.app.id}
        env: $${context.env.id}
  location: namespace
EOL
        outputs   = <<EOL
name: $${resources['azure-managed-identity'].outputs.principal_id}
EOL
      }
    })
  }

  provision = {
    "azure-federated-identity" = {
      match_dependents = false
      is_dependent     = true
    }
  }
}
