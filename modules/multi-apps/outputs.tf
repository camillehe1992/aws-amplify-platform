output "amplify_app_urls" {
  value = {
    for key, value in aws_amplify_app.this : key => value.default_domain
  }
  description = "Default domains for the Amplify app"
}

