module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.14.1"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  attributes = var.attributes
  delimiter  = var.delimiter
  tags       = var.tags
}

resource "aws_iam_user" "default" {
  name          = module.label.id
  path          = var.path
  force_destroy = var.force_destroy
}

resource "aws_iam_access_key" "default" {
  count = var.create_keys ? 1 : 0
  user  = aws_iam_user.default.name
}
