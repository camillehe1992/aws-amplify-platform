locals {
  branch_config = {
    for key, value in var.branch_config : key => value if value.enabled == true
  }
  platform_type     = "multi-apps"
  current_timestamp = timestamp()
  build_spec        = fileexists("${path.root}/amplify.yaml") ? "${path.root}/amplify.yaml" : "${path.module}/amplify.yaml"
}
