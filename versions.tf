terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "2.21.1-6.6.ga"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0.0"
    }
  }
  required_version = ">= 1.0"
}