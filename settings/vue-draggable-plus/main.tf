# Modules
module "multi-app" {
  source = "../../modules/multi-apps"

  aws_region    = var.aws_region
  aws_profile   = var.aws_profile
  nickname      = var.nickname
  app_name      = var.app_name
  repository    = var.repository
  access_token  = var.access_token
  branch_config = var.branch_config
}

# Outputs
output "domain_urls" {
  value = {
    for key, value in module.multi-app.amplify_app : key => value.default_domain
  }
}
