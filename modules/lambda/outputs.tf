output "name" {
  value = aws_lambda_function.lambda.function_name
}

output "id" {
  value = aws_lambda_function.lambda.id
}

output "arn" {
  value = aws_lambda_function.lambda.arn
}

output "arn_invoke" {
  value = aws_lambda_function.lambda.invoke_arn
}

output "role_name" {
  value = aws_iam_role.lambda_role.name
}

output "role_id" {
  value = aws_iam_role.lambda_role.id
}
