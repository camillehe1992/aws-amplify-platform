# Modules
module "multi-app" {
  source = "../../modules/multi-apps"

  environment  = var.environment
  nickname     = var.nickname
  app_name     = var.app_name
  access_token = var.access_token
  repository   = var.repository
  branch_name  = var.branch_name
}

# Outputs
output "domain_urls" {
  value = module.multi-app.amplify_app_url
}
