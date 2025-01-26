output "amplify_app" {
  value = {
    for key, value in aws_amplify_app.this : key => {
      default_domain = value.default_domain
      env_domain_url = "https://${local.branch_config[key].branch_name}.${value.default_domain}"
    }
  }
  description = "Attributes for the Amplify app"
}

output "branch_secrets" {
  value = local.branch_secrets
}
