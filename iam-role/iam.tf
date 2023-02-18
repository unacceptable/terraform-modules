resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = var.assume_role_policy
  path               = var.path
}

resource "aws_iam_policy" "this" {
  for_each = local.policies_map

  name   = "${var.name}-${each.key}"
  policy = each.value
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = local.policies_map
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this[each.key].arn
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_iam_instance_profile ? 1 : 0
  name  = var.name
  role  = aws_iam_role.this.name
}
