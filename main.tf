resource "azuredevops_project" "main" {
  name        = var.project_name
  description = var.project_description
  visibility  = var.visibility
}

resource "azuredevops_variable_group" "main" {
  project_id   = azuredevops_project.main.id
  name         = var.variable_group_name
  description  = var.variable_group_description
  allow_access = true



  dynamic "variable" {
    for_each = var.variables
    iterator = item


    content {

      name      = item.value.name
      value     = item.value.value
      is_secret = item.value.is_secret

    }
  }
}

resource "azuredevops_project_pipeline_settings" "main" {

  project_id = azuredevops_project.main.id
  for_each   = var.pipeline_settings

  enforce_job_scope                    = each.value.enforce_job_scope                    # Limit job authorization scope to current project for non-release pipelines
  enforce_referenced_repo_scoped_token = each.value.enforce_referenced_repo_scoped_token # Protect access to repositories in YAML pipelines
  publish_pipeline_metadata            = each.value.publish_pipeline_metadata            # Publish metadata from pipelines.
  enforce_settable_var                 = each.value.enforce_settable_var                 # Limit variables that can be set at queue time.
  status_badges_are_private            = each.value.status_badges_are_private            # Disable anonymous access to badges

  depends_on = [
    azuredevops_project.main
  ]
}

resource "azuredevops_project_features" "main" {
  project_id = azuredevops_project.main.id
  features = {

    "boards"    = "disabled"
    "testplans" = "disabled"
    "artifacts" = "disabled"
  }

  depends_on = [
    azuredevops_project.main
  ]
}


resource "azuredevops_git_repository" "main" {
  project_id = azuredevops_project.main.id
  for_each   = var.git_repositories
  name       = each.value.name
  initialization {
    init_type = "Clean"
  }

  depends_on = [
    azuredevops_project.main
  ]
}
