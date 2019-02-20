provider "aws" {
  region = "${var.region}"
}

####################
# API
####################
module "api" {
  source                   = "./modules/apigw"
  name                     = "${module.lambda.lambda_function}"
  stage_name               = "${var.stage_name}"
  method                   = "${var.method}"
  binary_type              = "${var.binary_type}"
  minimum_compression_size = "${var.minimum_compression_size}"
  lambda_arn               = "${module.lambda.lambda_function_arn}"
  lambda_arn_invoke        = "${module.lambda.lambda_function_arn_invoke}"
}

####################
# Lambda
####################
module "lambda" {
  source        = "./modules/lambda"
  function_name = "${var.project}-${var.lambda_name}-${var.stage_name}"
  handler       = "${var.lambda_handler}"
  runtime       = "${var.lambda_runtime}"
  memory        = "${var.lambda_memory}"
  timeout       = "${var.lambda_timeout}"
  package       = "${var.lambda_package}"
  env           = "${var.lambda_env}"
}
