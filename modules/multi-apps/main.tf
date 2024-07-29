resource "aws_amplify_app" "this" {
  for_each = var.branch_config

  name         = "${each.key}-${var.nickname}-${local.platform_type}"
  repository   = var.repository
  access_token = var.access_token
  build_spec   = file(local.build_spec)

  auto_branch_creation_config {
    enable_auto_build           = true
    enable_pull_request_preview = true
    framework                   = var.framework
  }

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  tags = var.tags
}

resource "aws_amplify_branch" "this" {
  for_each = var.branch_config

  app_id                      = aws_amplify_app.this[each.key].id
  branch_name                 = each.value.branch_name
  stage                       = var.stage
  enable_auto_build           = each.value.enable_auto_build
  enable_pull_request_preview = each.value.enable_pull_request_preview
}
