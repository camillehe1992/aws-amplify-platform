terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.59.0"
    }
  }
  required_version = "~> 1.8.0"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  default_tags {
    tags = {
      Platform_Type = local.platform_type
      Platform      = "Amplify Infrastructure Management Platform"
      Version       = "0.0.1"
      Deploy_At     = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", local.current_timestamp)
    }
  }
}
