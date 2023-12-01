# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "6452cb56-3faf-4e27-b652-27678098cf54"
  client_id       = "5b3e315b-4474-4cd4-a714-8609f55523fa"
  client_secret   = "iNr8Q~tXLyu-tbAbxriEcLIyhMyoK0AIwJQ_Kcm~"
  tenant_id       = "51035e1b-5ded-42f3-bf4b-0b6fd66f14c1"
}