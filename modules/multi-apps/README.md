# Terraform Overview

The detailed information about Terraform infrastructure. Use command [terraform-docs](https://terraform-docs.io/user-guide/installation/)  to re-generate the readme.

```bash
cd modules
terraform-docs -c .terraform-docs.yaml multi-apps > ./multi-apps/README.md
```

## Providers

| Name | Version |
| ---- | ------- |
| aws  | 5.59.0  |

The module automatically inherits default provider configurations from its parent.

## Resources

| Name                                                                                                                  | Type        |
| --------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_amplify_app.this](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/amplify_app)       | resource    |
| [aws_amplify_branch.this](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/amplify_branch) | resource    |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/data-sources/region)           | data source |

## Inputs

| Name                           | Description                                                                                                          | Type          | Default        | Required |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------- | ------------- | -------------- | :------: |
| access\_token                  | Personal access token for a third-party source control system for an Amplify app                                     | `string`      | n/a            |   yes    |
| app\_name                      | The web application name                                                                                             | `string`      | n/a            |   yes    |
| aws\_profile                   | AWS profile which used for terraform infra deployment                                                                | `string`      | `"default"`    |    no    |
| aws\_region                    | AWS region                                                                                                           | `string`      | n/a            |   yes    |
| branch\_name                   | Name for the branch                                                                                                  | `string`      | n/a            |   yes    |
| enable\_auto\_build            | Enables auto building for the branch                                                                                 | `bool`        | `true`         |    no    |
| enable\_pull\_request\_preview | Enables pull request previews for this branch                                                                        | `bool`        | `true`         |    no    |
| environment                    | The environment of application                                                                                       | `string`      | n/a            |   yes    |
| framework                      | The framework of web application                                                                                     | `string`      | `"Vue"`        |    no    |
| nickname                       | The nickname of application. Must be lowercase without special chars                                                 | `string`      | n/a            |   yes    |
| platform                       | The type of current platform                                                                                         | `string`      | `"multi-apps"` |    no    |
| repository                     | The repository for source code                                                                                       | `string`      | n/a            |   yes    |
| stage                          | Describes the current stage for the branch. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL\_REQUEST | `string`      | `"PRODUCTION"` |    no    |
| tags                           | The key value pairs we want to apply as tags to the resources contained in this module                               | `map(string)` | `{}`           |    no    |

## Outputs

| Name              | Description                        |
| ----------------- | ---------------------------------- |
| amplify\_app\_url | Default domain for the Amplify app |
