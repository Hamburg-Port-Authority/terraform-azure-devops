variable "project_name" {
  type        = string
  description = "The Project Name."

}

variable "project_description" {

  type        = string
  default     = "This is default description of a azure devops project"
  description = "The Description of the Project."

}

variable "visibilty" {

  type        = string
  default     = "private"
  description = "Specifies the visibility of the Project. Valid values: private or public. Defaults to private."

}

variable "variable_group_description" {

  type        = string
  default     = "This is default description of a azure devops variable group"
  description = "Azure Terraform Pipeline Configuration"

}

variable "variable_group_name" {
  type        = string
  description = "The name of the Variable Group."

}


variable "sp_client_id" {
  type        = string
  description = "The client-id from the app-registration."
  sensitive   = true
}

variable "sp_client_secret" {
  type        = string
  description = "The client-secret from the app-registration."
  sensitive   = true
}
variable "subscription_id" {
  type        = string
  description = "The subscription-id the resource are deployt over cicd."
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "The tenant-id with the used subscription-id."
  sensitive   = true
}

variable "identity_64" {
  type        = string
  description = "The identity is the private key and will be used to give flux-system access to gitrepo via ssh."
  sensitive   = true
}

variable "identity_pub_64" {
  type        = string
  description = "The public identity is the public key added to a user in azure devops and will be used to give flux-system access to gitrepo via ssh."
}

variable "known_hosts" {
  type        = string
  description = "The known_hosts File is a client file containing all remotely connected known hosts, and the ssh client uses this file. This file authenticates for the client to the server they are connecting to. The known_hosts file contains the host public key for all known hosts."
}

variable "pipeline_settings" {

  type        = map(bool)
  description = "Manages Pipeline Settings for Azure DevOps projects. The settings at the organization will override settings specified on the project."
  default = {
    "enforce_job_scope"                    = false
    "enforce_referenced_repo_scoped_token" = true
    "publish_pipeline_metadata"            = false
    "enforce_settable_var"                 = true
    "status_badges_are_private"            = true
  }
}

variable "tags" {
  type        = map(string)
  description = "Defines the default tags.  Some tags like owner are enforced by Azure policies. "
  default = {
    TF-Managed  = "true"
    TF-Worfklow = ""
    Maintainer  = ""

  }
}
