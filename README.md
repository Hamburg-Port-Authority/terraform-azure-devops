# Introduction:

The module is used to deploy azure devops project and variable groups over terraform with a default setup (Infrastructure as Code).

# Exmaple Use of Modul:

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
