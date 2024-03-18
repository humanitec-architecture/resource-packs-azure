# Azure resource pack

---

:construction: __This pack is experimental and currently not recommended for production usage.__ :construction:

---

A collection of Azure resources ready to be used with [Humanitec](https://humanitec.com/).

The following resources are included:

* [azure-blob/basic](./humanitec-resource-defs/azure-blob/basic): Basic Azure Storage Blob Container.
  * This example also show-cases how to configure a [Terraform Backend](https://developer.humanitec.com/integration-and-extensions/drivers/generic-drivers/terraform/).
* [azure-blob/delegator](./humanitec-resource-defs/azure-blob/delegator): Echo Azure Storage Blob Container output and co-provision role definition.
* [azure-federated-identity/basic](./humanitec-resource-defs/azure-federated-identity/basic): Basic Azure Federated Identity for bounding K8s Service Account with Azure Managed Entity.
* [azure-managed-identity/basic](./humanitec-resource-defs/azure-managed-identity/basic): Basic Azure managed identity.
* [azure-role-assignments/basic](./humanitec-resource-defs/azure-role-assignments/basic): Basic Role Assignment resource.
* [azure-role-definition/basic](./humanitec-resource-defs/azure-role-definition/basic): Basic Custom Role definition resource.
* [azure-role-definition/echo](./humanitec-resource-defs/azure-role-definition/echo): Echo built-in Azure Role Definitions.
* [azure-service-bus-queue/basic](./humanitec-resource-defs/azure-service-bus-queue/basic): Basic Azure Service Bus Queue.
* [azure-service-bus-queue/delegator](./humanitec-resource-defs/azure-service-bus-queue/delegator): Echo Azure Service Bus Queue output and co-provision role definition.
* [dns/basic](./humanitec-resource-defs/dns/basic): Basic Azure Cloud DNS resource.
* [k8s/service-account](./humanitec-resource-defs/k8s/service-account): Kubernetes Service Account.
* [mysql/basic](./humanitec-resource-defs/mysql/basic): Basic Azure Database for MySQL resource.
* [postgres/basic](./humanitec-resource-defs/postgres/basic): Basic Azure Database for Postgres resource.
* [redis/basic](./humanitec-resource-defs/redis/basic): Basic Azure Cache for Redis resource.
* [workload/service-account](./humanitec-resource-defs/workload/service-account): Inject a K8s Service Account with Workload Managed Identity into a `workload`.

The `humanitec-resource-defs` directory includes the respective resource definitions.

The `modules` directory includes the Terraform modules used by the [Humanitec Terraform Driver](https://developer.humanitec.com/integration-and-extensions/drivers/generic-drivers/terraform/) to provision the actual resources.
