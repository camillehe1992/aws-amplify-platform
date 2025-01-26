# Amplify Infrastructure Management Platform

The repository provides an AWS Amplify infrastructure management solution centrally.

The repository defines Amplify related infrastructure using Terraform, and modulized the resources for different senarios and use cases in `modules` directory.

In `settings` directory, each Amplify app has dedicated settings. Based on the settings, a dedicated GitHub workflow is trigged to provision the responsonding AWS infrastructure to the cloud.

## Getting Started

Step 1. Create a new folder for new project under `settings` directory using the nickname of project.

> Notes: The nickname of project is a short name with lowercase letters only that separated with `-`. For example `my-new-app`.

```bash
cp -r settings/amplify-vue-app settings/my-new-app
```

Step 2. Modify `settings/my-new-app/tfvars.json`.

| Field         | Type        | Value Example                                      | Description                                |
| ------------- | ----------- | -------------------------------------------------- | ------------------------------------------ |
| nickname      | string      | amplify-vue-app                                    | Nickname of project                        |
| app_name      | string      | Host Vue based web application in AWS Amplify      | Description of project                     |
| repository    | string      | <https://github.com/camillehe1992/amplify-vue-app> | Repository of frontend source code locates |
| branch_config | map(object) | -                                                  | Branch configuration for each environment  |

**branch_config** Environment

> Note: You can have more environments (int, test, uat, staging, etc) for your project. An Amplify app is created for each environment with environment prefixed.

| Environment | Description                                          |
| ----------- | ---------------------------------------------------- |
| dev         | The branch configuration for development environment |
| prod        | The branch configuration for production environment  |

**branch_config** Environment Branch Config

| Environment Branch Config   | Type        | Value   | Description                                   |
| --------------------------- | ----------- | ------- | --------------------------------------------- |
| enabled                     | boolean     | true    | Enable the environment deployment             |
| environment                 | string      | dev     | The environment short name                    |
| branch_name                 | string      | develop | The source code branch for the environment    |
| enable_auto_build           | boolean     | true    | Enables auto building for the branch          |
| enable_pull_request_preview | boolean     | true    | Enables pull request previews for this branch |
| environment_variables       | map(object) | {}      | Environment variables for the branch          |

**tfvars.json** Examples:

```json
{
  "nickname": "amplify-vue-app",
  "tags": {
    "project": "aws-amplify-platform",
    "nickname": "amplify-vue-app",
    "repository": "https://github.com/camillehe1992/amplify-vue-app"
  },
  "repository": "https://github.com/camillehe1992/amplify-vue-app",
  "branch_config": {
    "dev": {
      "enabled": true,
      "environment": "dev",
      "branch_name": "develop",
      "enable_auto_build": true,
      "enable_pull_request_preview": true,
      "environment_variables": {
        "VUE_BASE_API_URL": "https://amplify-vue-app-dev.example.com/api",
        "LOG_LEVEL": "DEBUG"
      }
    },
    "prod": {
      "enabled": false,
      "environment": "prod",
      "branch_name": "main",
      "enable_auto_build": true,
      "enable_pull_request_preview": true,
      "environment_variables": {
        "environment_variables": {
          "VUE_BASE_API_URL": "https://amplify-vue-app.example.com/api",
          "LOG_LEVEL": "INFO"
        }
      }
    }
  }
}
```

Step 4. Create GitHub Actions workflow.

```bash
cp .github/workflow/template.yaml .github/workflow/my-new-app.yaml
```

Update the `<NICKNAME>` in the workflow yaml file with the nickname you provide in `tfvars.json`.

Step 5. Deploy AWS infrastructure

After settings is completed, you can verify the deployment from local machine for development purpose. Or commit the code change, and push to remote. Trigger the new created workflow to provision Amplify app for the project in AWS.

See [Deployment Documentation](./docs/Deployment.md) for the detailed information.

## Troubleshoot

### 1. Operation error Amplify: CreateApp

If you met below error when applying Amplify app in AWS, update the AWS Amplify configuration in `GitHub -> Settings -> Integrations -> Applications -> Installed GitHub Apps` to add the new created repo in the list.

  ```text
  │ Error: creating Amplify App (prod-vue-draggable-plus-multi-apps): operation error Amplify: CreateApp, https response error StatusCode: 400, RequestID: 69a39f01-7e95-4857-98cb-c540ed524979, BadRequestException: There was an issue setting up your repository. Please try again later.({"message":"Bad credentials","documentation_url":"https://docs.github.com/rest","status":"401"})
  ```

### 2. Start a New Job for Your Amplify Branch

For the first deployment, you must start a new job for your Amplify branch from AWS console.
