terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.91"
    }
  }

  required_version = ">= 1.3.0"
}
