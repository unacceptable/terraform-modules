locals {
  policies_map = {
    for policy in var.policies : md5(policy) => policy
  }

  tags = merge(
    var.tags,
    {
      "module" = "aws-iam-role"
    }
  )
}
