output "amplify_app_url" {
  value       = aws_amplify_app.this.default_domain
  description = "Default domain for the Amplify app"
}

