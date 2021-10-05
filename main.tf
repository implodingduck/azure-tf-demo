terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.62.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.1.0"
    }
  }
  backend "azurerm" {

  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

module "webapp" {
  count = 0 # comment this out to actually deploy it
  source   = "github.com/implodingduck/tfmodules//webappvm"
  name     = "azure-tf-demo"
  location = "East US"
  vm_size  = "Standard_B2s"
  env      = var.env
  tags = {
    owner = "implodingduck"
  }
}
