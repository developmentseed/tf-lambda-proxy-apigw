output "api_url" {
  value = module.api.url
}

output "api_methods" {
  value = module.api.http_method
}

output "lambda_name" {
  value = module.lambda.name
}

output "lambda_arn" {
  value = module.lambda.arn
}

output "lambda_role" {
  value = module.lambda.role_name
}

output "lambda_role_id" {
  value = module.lambda.role_id
}
