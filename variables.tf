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


variable "variables" {
  type = map(object({
    name      = string
    value     = string
    is_secret = bool


  }))
  default = {}

  description = "List of variables to configure variables in azure pipeline library group."
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
