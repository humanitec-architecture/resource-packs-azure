locals {
  def_id         = "${var.prefix}managed-identity-basic"
  remote_backend = <<EOT
terraform {
  required_version = ">= 1.0.0"

  %{if var.terraform_state != null}backend "azurerm" {
    subscription_id       = "${var.terraform_state.subscription_id}"
    resource_group_name   = "${var.terraform_state.resource_group_name}"
    storage_account_name  = "${var.terraform_state.storage_account_name}"
    container_name        = "${var.terraform_state.container_name}"
    key                   = "${coalesce(var.terraform_state.key_prefix, local.def_id)}/$${context.app.id}/$${context.env.id}/$${context.res.id}.tfstate"
  }%{endif}
}
EOT
  files = var.terraform_state != null ? {
    "backend.tf" = local.remote_backend
  } : {}
}


resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = local.def_id
  name        = local.def_id
  type        = "azure-managed-identity"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/azure-managed-identity/basic"
        rev  = var.resource_packs_azure_rev
        url  = var.resource_packs_azure_url
      }

      append_logs_to_error = var.append_logs_to_error

      credentials_config = {
        environment = {
          ARM_CLIENT_ID     = "appId"
          ARM_CLIENT_SECRET = "password"
          ARM_TENANT_ID     = "tenant"
        }
      }

      files = local.files

      variables = {
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        name                = var.name
        subscription_id     = var.subscription_id
        resource_group_name = var.resource_group_name
      }
    })
  }

  provision = {
    "azure-role-assignments" = {
      match_dependents = false
      is_dependent     = true
    }
  }
}
