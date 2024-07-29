# Default Deployment Variables
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile which used for terraform infra deployment"
}

variable "framework" {
  type        = string
  default     = "Vue"
  description = "The framework of web application"
}

variable "stage" {
  type        = string
  default     = "PRODUCTION"
  description = "Describes the current stage for the branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The key value pairs we want to apply as tags to the resources contained in this module"
}

# variable "enable_auto_build" {
#   type        = bool
#   default     = true
#   description = "Enables auto building for the branch"
# }

# variable "enable_pull_request_preview" {
#   type        = bool
#   default     = true
#   description = "Enables pull request previews for this branch"
# }

# Custom Deployment Variables
# variable "environment" {
#   type        = string
#   description = "The environment of application"
# }

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

# variable "branch_name" {
#   type        = string
#   description = "Name for the branch"
# }

variable "branch_config" {
  type = map(object({
    environment                 = string
    branch_name                 = string
    enable_auto_build           = string
    enable_pull_request_preview = string
  }))
  description = "The branch config of current platform"
}