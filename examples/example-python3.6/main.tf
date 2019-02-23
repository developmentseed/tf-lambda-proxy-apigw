# Variables
variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "bucket" {
  type    = "string"
  default = "a-bucket"
}

variable "stage_name" {
  description = "The stage name(production/staging/etc..)"
  default     = "production"
}

# API Gateway + Lambda
module "lambda_api" {
  source = "../../"

  # General options
  project    = "my_project"
  stage_name = "${var.stage_name}"
  region     = "${var.region}"

  # Lambda options
  lambda_name    = "api"
  lambda_runtime = "python3.6"
  lambda_memory  = "3008"
  lambda_timeout = "10"
  lambda_package = "package.zip"
  lambda_handler = "handlers.lambda_handler"

  lambda_env = {
    PYTHONWARNINGS = "ignore"
  }
}

# Extent Lambda role
resource "aws_iam_role_policy" "permissions" {
  name = "${module.lambda_api.lambda_role}-bucket-permission"
  role = "${module.lambda_api.lambda_role_id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*",
      ],
      "Resource": "arn:aws:s3:::${var.bucket}*"
    }
  ]
}
EOF
}

# Outputs
output "endpoint" {
  description = "endpoint url"
  value       = "${module.lambda_api.api_url}"
}
