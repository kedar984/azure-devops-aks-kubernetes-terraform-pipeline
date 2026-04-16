terraform {
    required_version = ">= 1.14.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.8.0"
    }
     random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
  backend "azurerm" {
     # Can also be set via `ARM_ACCESS_KEY` environment variable.
    resource_group_name = "BankBI"
    storage_account_name = "mvpstorageaccount1231"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstatefiles"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "test.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
provider "azurerm" {
    features {
        resource_group {
            prevent_deletion_if_contains_resources = false
        }
    }
}
resource "random_pet" "random" {
 
}
