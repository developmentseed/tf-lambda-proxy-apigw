output "api_url" {
  value = "${module.api.api_url}"
}

output "api_methods" {
  value = "${module.api.http_method}"
}

output "lambda_name" {
  value = "${module.lambda.lamda_fuction_name}"
}

output "lambda_ard" {
  value = "${module.lambda.lamda_fuction_arn}"
}

output "lambda_role" {
  value = "${module.lambda.lamda_role_name}"
}

output "lambda_role_id" {
  value = "${module.lambda.lamda_role_id}"
}
