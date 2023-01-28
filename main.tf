resource "azuredevops_project" "main" {
  name        = var.project_name
  description = var.project_description
  visibility  = var.visibilty
}

resource "azuredevops_variable_group" "main" {
  project_id   = azuredevops_project.main.id
  name         = var.variable_group_name
  description  = var.variable_group_description
  allow_access = true

  variable {
    name      = "ARM_CLIENT_ID"
    value     = var.sp_client_id
    is_secret = true
  }

  variable {
    name      = "ARM_CLIENT_SECRET"
    value     = var.sp_client_secret
    is_secret = true
  }

  variable {
    name         = "ARM_TENANT_ID"
    secret_value = var.tenant_id
    is_secret    = true

  }

  variable {
    name         = "ARM_SUBSCRIPTION_ID"
    secret_value = var.subscription_id
    is_secret    = true

  }

  variable {
    name         = "identity64"
    secret_value = var.identity_64
    is_secret    = true

  }

  variable {
    name         = "identityPub64"
    secret_value = var.identity_pub_64
    is_secret    = true

  }

  variable {
    name         = "knownHosts"
    secret_value = var.known_hosts
    is_secret    = true

  }
}

resource "azuredevops_project_pipeline_settings" "main" {

  project_id = azuredevops_project.main.id
  for_each   = var.pipeline_settings

  enforce_job_scope                    = each.value.enforce_job_scope                    # Limit job authorization scope to current project for non-release pipelines
  enforce_referenced_repo_scoped_token = each.value.enforce_referenced_repo_scoped_token # Protect access to repositories in YAML pipelines
  publish_pipeline_metadata            = each.value.publish_pipeline_metadata            #Publish metadata from pipelines.
  enforce_settable_var                 = each.value.enforce_settable_var                 #Limit variables that can be set at queue time.
  status_badges_are_private            = each.value.status_badges_are_private            # Disable anonymous access to badges


}