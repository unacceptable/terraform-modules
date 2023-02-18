variable "assume_role_policy" {
  type        = string
  default     = <<-POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
  }
  POLICY
  description = "The policy that grants an entity permission to assume the role"
}

variable "create_iam_instance_profile" {
  type        = bool
  default     = false
  description = "Whether to create an IAM instance profile (used to associate IAM role with EC2 instance)"
}

variable "name" {
  type        = string
  default     = null
  description = "The name of the role"
}

variable "path" {
  type        = string
  default     = "/"
  description = "The path to the role"
}

variable "policies" {
  type        = list(string)
  default     = []
  description = "A list of IAM policies to attach to the role"
}

variable "policy_arns" {
  type        = list(string)
  default     = []
  description = "A list of managed IAM policies to attach to the role"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to all resources."
}
