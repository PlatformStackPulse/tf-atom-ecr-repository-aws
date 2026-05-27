resource "aws_ecr_repository" "this" {
  count = module.this.enabled ? 1 : 0

  name                 = module.this.id
  image_tag_mutability = var.image_tag_mutability
  force_delete         = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  dynamic "encryption_configuration" {
    for_each = var.encryption_type != null ? [1] : []
    content {
      encryption_type = var.encryption_type
      kms_key         = var.kms_key_arn
    }
  }
}
