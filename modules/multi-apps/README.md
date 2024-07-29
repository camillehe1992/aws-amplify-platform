# Terraform Overview

The detailed information about Terraform infrastructure. Use command [terraform-docs](https://terraform-docs.io/user-guide/installation/)  to re-generate the readme.

```bash
cd modules
terraform-docs -c .terraform-docs.yaml multi-apps > ./multi-apps/README.md
```

## Providers

| Name | Version |
|------|---------|
| aws | 5.59.0 |

The module automatically inherits default provider configurations from its parent.

## Resources

| Name | Type |
|------|------|
| [aws_amplify_app.this](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/amplify_app) | resource |
| [aws_amplify_branch.this](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/amplify_branch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_token | Personal access token for a third-party source control system for an Amplify app | `string` | n/a | yes |
| app\_name | The web application name | `string` | n/a | yes |
| aws\_profile | AWS profile which used for terraform infra deployment | `string` | `null` | no |
| aws\_region | AWS region | `string` | n/a | yes |
| branch\_config | The branch config of current platform | ```map(object({ environment = string branch_name = string enable_auto_build = string enable_pull_request_preview = string environment_variables = map(string) }))``` | n/a | yes |
| framework | The framework of web application | `string` | `"Vue"` | no |
| nickname | The nickname of application. Must be lowercase without special chars | `string` | n/a | yes |
| repository | The repository for source code | `string` | n/a | yes |
| stage | Describes the current stage for the branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL\_REQUEST | `string` | `"PRODUCTION"` | no |
| tags | The key value pairs we want to apply as tags to the resources contained in this module | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| amplify\_app | Attributes for the Amplify app |
