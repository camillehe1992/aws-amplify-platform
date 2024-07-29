locals {
  platform_type     = "multi-apps"
  current_timestamp = timestamp()
  build_spec        = fileexists("${path.root}/amplify.yaml") ? "${path.root}/amplify.yaml" : "${path.module}/amplify.yaml"
}
