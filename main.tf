provider "aws" {
  region = "${var.region}"
}

####################
# API
####################
module "api" {
  source                   = "./modules/apigw"
  name                     = "${var.project}-${var.lambda_name}-${var.stage_name}"
  stage                    = "${var.stage_name}"
  method                   = "${var.method}"
  binary_type              = "${var.binary_type}"
  minimum_compression_size = "${var.minimum_compression_size}"
  lambda_arn               = "${module.lambda.arn}"
  lambda_arn_invoke        = "${module.lambda.arn_invoke}"
}

####################
# Lambda
####################
module "lambda" {
  source  = "./modules/lambda"
  name    = "${var.project}-${var.lambda_name}-${var.stage_name}"
  handler = "${var.lambda_handler}"
  runtime = "${var.lambda_runtime}"
  memory  = "${var.lambda_memory}"
  timeout = "${var.lambda_timeout}"
  package = "${var.lambda_package}"
  env     = "${var.lambda_env}"
}
