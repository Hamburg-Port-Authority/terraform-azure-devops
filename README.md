# Introduction:

The module is used to deploy azure devops project and variable groups over terraform with a default setup (Infrastructure as Code).

> **_NOTE:_** The required providers, providers configuration and terraform version are maintained in the user's configuration and are not maintained in the modules themselves.

# Example Use of Module:

    module "devops" {

         source = "github.com/la-cc/terraform-azure-devops?ref=1.0.0"

         project_name           = var.project_name

         variable_group_name    = var.variable_group_name
         sp_client_id           = var.sp_client_id
         sp_client_secret       = var.sp_client_secret
         tenant_id              = var.tenant_id
         subscription_id        = var.subscription_id
         identity_64            = var.identity_64
         identity_pub_64        = var.identity_pub_64
         known_hosts            = var.known_hosts


      }
