resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/template"
  id          = "${var.prefix}service-bus-${var.service_bus_resource_class}-${var.policy_resource_class}"
  name        = "${var.prefix}service-bus-${var.service_bus_resource_class}-${var.policy_resource_class}"
  type        = "azure-service-bus-queue"

  driver_inputs = {
    values_string = jsonencode({
      templates = {
        outputs = <<EOL
hostname: "$${resources['azure-service-bus-queue.${var.service_bus_resource_class}'].outputs.hostname}"
namespace: "$${resources['azure-service-bus-queue.${var.service_bus_resource_class}'].outputs.namespace}"
queue: "$${resources['azure-service-bus-queue.${var.service_bus_resource_class}'].outputs.queue}"
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
