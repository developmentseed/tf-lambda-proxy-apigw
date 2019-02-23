# Terraform: API Gateway Proxy + AWS Lambda


Terraform module to create AWS [Lambda](https://www.terraform.io/docs/providers/aws/r/lambda_function.html) and API gateway with COORS, binary support and `{proxy+}` integration.

Note: This module was developed to support Lambda dynamic tilling for python Lambda functions.

## How to use this module

```terraform
module "lambda_proxy_api" {
    source         = "git@github.com:developmentseed/tf-lambda-proxy-apigw.git"

    # General options
    project                  = "${var.project}"
    stage_name               = "${var.stage_name}"
    region                   = "${var.region}"

    # Lambda options
    lambda_name              = "${var.lambda_name}"
    lambda_runtime           = "${var.lambda_runtime}"
    lambda_memory            = "${var.lambda_memory}"
    lambda_timeout           = "${var.lambda_timeout}"
    lambda_package           = "${var.lambda_package}"
    lambda_handler           = "${var.lambda_handler}"
    lambda_env               = "${var.lambda_env}"
    lambda_tags              = "${var.lambda_tags}"

    # API Gateway options
    binary_type              = "${var.binary_type}"
    minimum_compression_size = "${var.minimum_compression_size}"
    method                   = "${var.method}"
}
```

**Extend Lambda IAM role**

```terraform
resource "aws_iam_role_policy" "permissions" {
  name = "${module.lambda_proxy_api.lambda_role}-bucket-permission"
  role = "${module.lambda_proxy_api.lambda_role_id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": "arn:aws:s3:::${var.my_bucket}*"
    }
  ]
}
EOF
}
```

## Examples

- [example-with-basic-python-function](https://github.com/developmentseed/tf-lambda-proxy-apigw/tree/master/examples/example-python3.6)


## Inputs

| Name                     | Description                                               | Required | Default     |
|--------------------------|-----------------------------------------------------------|----------|-------------|
| project                  | Project name                                              | Yes      |             |
| stage                    | Stage (e.g. prod, dev, staging)                           | Yes      |             |
| region                   | The AWS region, e.g., eu-west-1                           | Yes      |             |
| lambda_name              | The Name of the lambda function                           | Yes      |             |
| lambda_runtime           | The runtime of the lambda function e.g, python3.6         | Yes      |             |
| lambda_memory            | The memory size of the function                           | No       | 128         |
| lambda_timeout           | The timeout of the lambda function                        | No       | 3           |
| lambda_package           | The lambda package name                                   | No       | package.zip |
| lambda_handler           | The handler name of the lambda function                   | Yes      |             |
| lambda_env               | The list of environment variables for the lambda function | No       |             |
| lambda_tags              | Tags used for the AWS Lambda resources                    | No       |             |
| binary_type              | The list of binary media types supported by the RestApi   | No       | ["\*/\*"]   |
| minimum_compression_size | Minimum response size to compress for the REST API        | No       | 0           |
| method                   | The HTTP method for the REST API                          | Yes      | ANY         |

## Outputs

| Name           | Description                                                                                                        |
| -------------- | ------------------------------------------------------------------------------------------------------------------ |
| api_url        | The API Gateway endpoint url.                                                                                      |
| api_methods    | The HTTP methods allowed by the API Gateway endpoint url.                                                          |
| lambda_name    | The unique name of your Lambda Function.                                                                           |
| lambda_arn     | The ARN to be used for invoking Lambda Function from API Gateway                                                   |
| lambda_role    | The name of the IAM role attached to the Lambda Function.                                                          |
| lambda_role_id | The id of the IAM role attached to the Lambda Function.                                                            |
