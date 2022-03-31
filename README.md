# my ace-iac-lab-enhancements
This repository builds out the following infrastructure for My Aviatrix ACE IaC Test Enhancements:
- Aviatrix Transit in AWS LON
- Aviatrix Spoke in AWS LON
- Aviatrix Spoke in Azure CAN
- Ubuntu VMs with password authentication (1 per SpGw)
- Multi-Cloud Segmentation (2 security domains)
- Aviatrix Controller & CoPilot in AWS FRA

Component | Version
Aviatrix Controller | UserConnect-6.6.5413 (6.6)
Aviatrix Terraform Provider | > 2.21.1
Terraform | > 1.0.8
AWS Terraform Provider | > 3.0
Azure Terraform Provider | > 2.0.0

### Dependencies

- Software version requirements met
- Aviatrix Controller with Access Accounts defined for AWS
- Sufficient AWS EIPs for region in scope
- Account credentials for Aviatrix Controller, AWS & Azure defined in environment. The following environment variables will be needed:
  - controller_ip
  - username
  - password
  - ace-password (for Ubuntu instances)
  - aws_account_name
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY
  - TF_VAR_azure_subscription_id
  - TF_VAR_azure_tenant_id
  - TF_VAR_azure_client_id
  - TF_VAR_azure_client_secret 


