locals {
  current_timestamp = timestamp()
  platform_tags = {
    platform         = "Amplify Infrastructure Management Platform"
    platform_version = "0.0.1"
    deploy_at        = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", local.current_timestamp)
  }
  default_tags = {
    app_name    = var.app_name
    environment = var.environment
    nickname    = var.nickname
  }
}
