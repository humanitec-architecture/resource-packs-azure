# Resources required for the terraform backend
# More details https://developer.humanitec.com/integration-and-extensions/drivers/generic-drivers/terraform/

resource "random_string" "storage_account_suffix" {
  length  = 12
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "humrp${random_string.storage_account_suffix.result}tfstate"
  resource_group_name             = data.azurerm_resource_group.main.name
  location                        = data.azurerm_resource_group.main.location
  account_tier                    = "Standard"
  account_replication_type        = "ZRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

locals {
  terraform_state = {
    subscription_id      = var.subscription_id
    resource_group_name  = data.azurerm_resource_group.main.name
    storage_account_name = azurerm_storage_account.tfstate.name
    container_name       = azurerm_storage_container.tfstate.name
    # key_prefix is set by the respective resource definition
  }
}
