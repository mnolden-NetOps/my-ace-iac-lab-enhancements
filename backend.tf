terraform {
  required_version = ">= 1.1.1"
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "OrangeBusinessServices_MySandBox"
    workspaces {
      name = "ace-iac-test-enhancements"
    }
  }
}
