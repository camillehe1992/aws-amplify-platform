output "amplify_app" {
  value = {
    for key, value in aws_amplify_app.this : key => value
  }
  description = "Attributes for the Amplify app"
}

