# Modules
module "multi-app" {
  source = "../../modules/multi-apps"

  aws_region    = var.aws_region
  aws_profile   = var.aws_profile
  nickname      = var.nickname
  repository    = var.repository
  access_token  = var.access_token
  branch_config = var.branch_config
}

# Outputs
output "domain_urls" {
  value       = module.multi-app.amplify_app
  description = "The access domain url for each environment."
}
