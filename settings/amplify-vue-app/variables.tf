variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile which used for terraform infra deployment"
}

variable "nickname" {
  type        = string
  description = "The nickname of application. Must be lowercase without special chars"
}

variable "app_name" {
  type        = string
  description = "The web application name"
}

variable "repository" {
  type        = string
  description = "The repository for source code"
}

variable "access_token" {
  type        = string
  description = "Personal access token for a third-party source control system for an Amplify app"
  sensitive   = true
}

variable "branch_config" {
  type = map(object({
    environment                 = string
    branch_name                 = string
    enable_auto_build           = string
    enable_pull_request_preview = string
  }))
  description = "The branch config of current platform"
}
