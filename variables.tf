variable "project_name" {
  type        = string
  description = "The Project Name."

}

variable "project_description" {

  type        = string
  default     = "This is default description of a azure devops project"
  description = "The Description of the Project."

}

variable "visibility" {

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

variable "enable_repository" {
  type        = bool
  default     = false
  description = "Allow you create repository if you want create a project with a repository"
}
variable "enable_variable_group" {
  type        = bool
  default     = true
  description = ""
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

  type = map(object({
    enforce_job_scope                    = bool
    enforce_referenced_repo_scoped_token = bool
    publish_pipeline_metadata            = bool
    enforce_settable_var                 = bool
    status_badges_are_private            = bool



  }))
  description = "Manages Pipeline Settings for Azure DevOps projects. The settings at the organization will override settings specified on the project."
  default = {
    "default_config" = {
      enforce_job_scope                    = false
      enforce_referenced_repo_scoped_token = true
      enforce_settable_var                 = false
      publish_pipeline_metadata            = true
      status_badges_are_private            = true
    }
  }
}

variable "git_repositories" {

  type = map(object({
    name           = string
    default_branch = string
  }))
  description = "Creates multiple initial empty gitrepos."
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
