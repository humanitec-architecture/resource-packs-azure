output "hostname" {
  value = regex("//(.*):", azurerm_servicebus_namespace.namespace.endpoint)[0]
}

output "namespace" {
  value = azurerm_servicebus_namespace.namespace.name
}

output "queue" {
  value = azurerm_servicebus_queue.queue.name
}
