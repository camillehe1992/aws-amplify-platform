variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  nullable    = true
  default     = "default"
  description = "AWS profile which used for terraform infra deployment"
}

variable "framework" {
  type        = string
  default     = "Vue"
  description = "The framework of web application"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The key value pairs we want to apply as tags to the resources contained in this module"
}

variable "nickname" {
  type        = string
  description = "The nickname of application. Must be lowercase without special chars"
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
    enabled                     = bool
    environment                 = string
    branch_name                 = string
    enable_auto_build           = string
    enable_pull_request_preview = string
    environment_variables       = map(string)
  }))
  description = "The branch config of current platform"
}
