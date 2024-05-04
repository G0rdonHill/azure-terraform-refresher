terraform {
  cloud {
    organization = "gh-personal"
    workspaces {
      name = "dev"
    }
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}
