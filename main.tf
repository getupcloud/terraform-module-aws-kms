locals {
  name_prefix = substr("${var.cluster_name}-kms", 0, 32)
}

data "aws_iam_policy_document" "aws_kms" {
  statement {
    effect = "Allow"

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]

    resources = [
      "arn:aws:kms:${var.region}:${var.account_id}:key/${var.key_id}"
    ]
  }
}

resource "aws_iam_policy" "aws_kms" {
  name        = local.name_prefix
  description = "KMS policy for EKS cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.aws_kms.json
}


module "irsa_aws_kms" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 4.2"

  create_role                   = true
  role_name                     = local.name_prefix
  provider_url                  = var.cluster_oidc_issuer_url
  role_policy_arns              = [aws_iam_policy.aws_kms.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"]
  tags                          = var.tags
}
