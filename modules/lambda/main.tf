resource "aws_lambda_function" "lambda" {
  function_name = "${var.name}"
  description   = "Lambda for ${var.name}"
  handler       = "${var.handler}"
  runtime       = "${var.runtime}"
  memory_size   = "${var.memory}"
  timeout       = "${var.timeout}"
  role          = "${aws_iam_role.lambda_role.arn}"

  filename         = "${var.package}"
  source_code_hash = "${base64sha256(file("${var.package}"))}"
  publish          = true

  environment {
    variables = "${var.env}"
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.name}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "logs" {
  name = "${aws_iam_role.lambda_role.name}-logs"
  role = "${aws_iam_role.lambda_role.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
