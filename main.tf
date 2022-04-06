/// ACE-IAC Core Aviatrix Infrastructure

# Private Key creation
resource "tls_private_key" "avtx_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ace_key" {
  provider   = aws.london
  key_name   = var.ace_ec2_key_name
  public_key = tls_private_key.avtx_key.public_key_openssh
}

# Create an Aviatrix Transit Gateway in AWS
module "aws_transit_1" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version             = "1.1.3"
  cloud               = "AWS"
  account             = var.aws_account_name
  region              = var.aws_transit1_region
  name                = var.aws_transit1_name
  cidr                = var.aws_transit1_cidr
  ha_gw               = var.ha_enabled
  instance_size       = var.aws_transit_instance_size
  enable_segmentation = true
}

# Create an Aviatrix Spoke Gateway in AWS
module "aws_spoke_1" {
  source          = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version         = "1.1.2"
  cloud           = "AWS"
  account         = var.aws_account_name
  region          = var.aws_spoke1_region
  name            = var.aws_spoke1_name
  cidr            = var.aws_spoke1_cidr
  instance_size   = var.aws_spoke_instance_size
  ha_gw           = var.ha_enabled
  security_domain = aviatrix_segmentation_security_domain.BU1.domain_name
  transit_gw      = module.aws_transit_1.transit_gateway.gw_name
}

# Create an Aviatrix Spoke Gateway in Azure
module "azure_spoke_2" {
  source          = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version         = "1.1.2"
  cloud           = "Azure"
  account         = aviatrix_account.azure_account.account_name
  region          = var.azure_spoke2_region
  name            = var.azure_spoke2_name
  cidr            = var.azure_spoke2_cidr
  instance_size   = var.azure_spoke_instance_size
  ha_gw           = var.ha_enabled
  security_domain = aviatrix_segmentation_security_domain.BU2.domain_name
  transit_gw      = module.aws_transit_1.transit_gateway.gw_name
}

# Create an Aviatrix Spoke Gateway in GCP
module "gcp_spoke_3" {
  source          = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version         = "1.1.2"
  cloud           = "GCP"
  account         = var.gcp_account_name
  region          = var.gcp_spoke3_region
  name            = var.gcp_spoke3_name
  cidr            = var.gcp_spoke3_cidr
  instance_size   = var.gcp_spoke_instance_size
  ha_gw           = var.ha_enabled
  security_domain = aviatrix_segmentation_security_domain.BU1.domain_name
  transit_gw      = module.aws_transit_1.transit_gateway.gw_name
}

# Multi-Cloud Segmentation
resource "aviatrix_segmentation_security_domain" "BU1" {
  domain_name = "BU1"
  depends_on = [
    module.aws_transit_1
  ]
}
resource "aviatrix_segmentation_security_domain" "BU2" {
  domain_name = "BU2"
  depends_on = [
    module.aws_transit_1
  ]
}
resource "aviatrix_segmentation_security_domain_connection_policy" "BU1_BU2" {
  domain_name_1 = aviatrix_segmentation_security_domain.BU1.domain_name
  domain_name_2 = aviatrix_segmentation_security_domain.BU2.domain_name
}