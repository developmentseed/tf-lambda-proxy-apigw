output "lambda_fuction_name" {
  value = "${aws_lambda_function.lambda.function_name}"
}

output "lambda_fuction_id" {
  value = "${aws_lambda_function.lambda.id}"
}

output "lambda_fuction_arn" {
  value = "${aws_lambda_function.lambda.arn}"
}

output "lambda_fuction_arn_invoke" {
  value = "${aws_lambda_function.lambda.invoke_arn}"
}

output "lambda_role_name" {
  value = "${aws_iam_role.lambda_role.name}"
}

output "lambda_role_id" {
  value = "${aws_iam_role.lambda_role.id}"
}
