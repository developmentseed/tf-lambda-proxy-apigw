output "http_method" {
  value = "${aws_api_gateway_method.request_method.http_method}"
}

output "api_url" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}"
}
