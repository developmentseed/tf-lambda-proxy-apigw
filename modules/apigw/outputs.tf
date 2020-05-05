output "http_method" {
  value = aws_api_gateway_method.request_method.http_method
}

output "url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}

output "rest_api_id" {
  value = aws_api_gateway_rest_api.api.id
}
