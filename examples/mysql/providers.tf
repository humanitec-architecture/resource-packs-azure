terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.91"
    }
    humanitec = {
      source  = "humanitec/humanitec"
      version = "~> 1.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "humanitec" {
}

provider "azuread" {
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}
