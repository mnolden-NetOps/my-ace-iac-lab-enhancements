### my ace-iac-lab-enhancements
My Aviatrix Infrastructure as Code Lab Enhancements beyond the Aviatrix Certified Enginner Infrastructure as Code Portal - Lab 1 to Lab 3

This repository builds out the following infrastructure for My Aviatrix Infrastructure as Code Lab Enhancements:
- Aviatrix Transit in AWS LON
- Aviatrix Spoke in AWS LON
- Aviatrix Spoke in Azure CAN
- Aviatrix Spoke in GCP SIN
- Ubuntu VMs & Bastion with password authentication (1 per SpGw)
- Multi-Cloud Segmentation (2 security domains)
- Aviatrix Controller & CoPilot in AWS FRA

Component | Version
--- | ---
Aviatrix Controller | UserConnect-6.6.5545 (6.6)
Aviatrix Terraform Provider | > 2.21
Terraform | > 1.1.0
AWS Terraform Provider | > 3.0
Azure Terraform Provider | > 3.0.0
GCP Terraform Provider | > 4.0.0

### dependencies
- Software version requirements met
- Aviatrix Controller with Access Accounts defined for AWS
- Sufficient AWS EIPs for region in scope
- Account credentials for Aviatrix Controller, AWS, Azure & GCP defined in environment. 

The following Terrafrom variables will be needed:
  - controller_ip
  - username
  - password
  - ace-password (for Ubuntu instances)
  - aws_account_name
  - gcp_account_name
  - gcp_project_id

  The following Environment variables will be needed:
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY
  - TF_VAR_azure_subscription_id
  - TF_VAR_azure_tenant_id
  - TF_VAR_azure_client_id
  - TF_VAR_azure_client_secret
  - GOOGLE_CREDENTIALS


