# Module: iam-role

Creates an IAM Role and associated Policies in AWS.

## Example Usage

How to create an IAM Role using this module:

```hcl
module "iam_example" {
  source   = "git@gitlab.com:aztek-io/iac/modules/iam-role.git?ref=v0.3.0"

  name = "example"

  policies = [
    jsonencode(
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Action": "dynamodb:PutItem",
            "Resource": "arn:aws:dynamodb:*:${var.account_id}:table/${var.environment}-example"
          }
        ]
      }
    )
  ]

  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.managed](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [random_string.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | The policy that grants an entity permission to assume the role | `string` | `"{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\"\n    }\n  ]\n}\n"` | no |
| <a name="input_create_iam_instance_profile"></a> [create\_iam\_instance\_profile](#input\_create\_iam\_instance\_profile) | Whether to create an IAM instance profile (used to associate IAM role with EC2 instance) | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the role | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | The path to the role | `string` | `"/"` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | A list of IAM policies to attach to the role | `list(string)` | `[]` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | A list of managed IAM policies to attach to the role | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->
