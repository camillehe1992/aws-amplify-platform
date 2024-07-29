# Global Deployment Variables
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS profile which used for terraform infra deployment"
}

# Custom Deployment Variables
variable "environment" {
  type        = string
  description = "The environment of application"
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

variable "branch_name" {
  type        = string
  description = "Name for the branch"
}

variable "access_token" {
  type        = string
  description = "Personal access token for a third-party source control system for an Amplify app"
  sensitive   = true
}

