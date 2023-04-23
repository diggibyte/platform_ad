terraform {
  required_version = ">=0.13"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "DGB-RG-PF-001"
    storage_account_name = "dgbstpf001"
    container_name       = "tfaad"
    key                  = "aadmapping/terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = var.SUBSCRIPTION_AD_ID
  client_id       = var.CLIENT_AD_ID
  client_secret   = var.CLIENT_AD_SECRET
  tenant_id       = var.TENANT_AD_ID

}

provider "azuread" {
  client_id     = var.CLIENT_AD_ID
  client_secret = var.CLIENT_AD_SECRET
  tenant_id     = var.TENANT_AD_ID

}