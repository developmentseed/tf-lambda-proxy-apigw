# Simple python3.6 example

Creates an AWS Lambda function and its {proxy+}/COORS API gateway integration

## requirements

* [Terraform 0.11.11+](https://www.terraform.io/)
* authentication configuration for the [aws provider](https://www.terraform.io/docs/providers/aws/)

## usage

```
terraform init

terraform plan

terraform apply --var stage_name=test --var bucket=my-bucket --var region=us-west-2
```
