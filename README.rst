:Version: 0.0.1
:Web: https:/github.com/developmentseed/tf-lambda-proxy-apigw
:Download: https://github.com/developmentseed/tf-lambda-proxy-apigw
:Source: https://github.com/developmentseed/tf-lambda-proxy-apigw
:Keywords: tf-lambda-proxy-apigw

.. contents:: Table of Contents:
    :local:

Terraform API Gateway Proxy + AWS Lambda
========================================

Usage
*****

Include this repository as a module in your existing terraform code:

.. code-block::

    module "lambda-proxy-api" {
        source         = "git@github.com:developmentseed/tf-lambda-proxy-apigw.git"

        # General options
        project                  = "${var.project}"
        stage_name               = "${var.stage_name}"
        region                   = "${var.region}"

        # Lambda options
        lambda_name              = "${var.lambda_name}"
        lambda_runtime           = "${var.lambda_runtime}"
        lambda_memory            = "${var.lambda_memory}"
        lambda_timeout           = "${var.lambda_timeout}"
        lambda_package           = "${var.lambda_package}"
        lambda_handler           = "${var.lambda_handler}"
        lambda_env               = "${var.lambda_env}"

        # API Gateway options
        binary_type              = "${var.binary_type}"
        minimum_compression_size = "${var.minimum_compression_size}"
        method                   = "${var.method}"
    }


Variables
---------

+--------------------------+------------+-----------------------------------------------------------+----------+
| Name                     | Default    | Description                                               | Required |
+==========================+============+===========================================================+==========+
| project                  |            | Project name                                              | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| stage                    |            | Stage (e.g. prod, dev, staging)                           | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| region                   |            | The AWS region, e.g., eu-west-1                           | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_name              |            | The Name of the lambda function                           | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_runtime           |            | The runtime of the lambda function e.g, python3.6         | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_memory            | 128        | The memory size of the function                           | No       |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_timeout           | 3          | The timeout of the lambda function                        | No       |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_package           | package.zip| The lambda package name                                   | No       |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_handler           |            | The handler name of the lambda function                   | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| lambda_env               |            | The list of environment variables for the lambda function | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
| binary_type              | ["\*/\*"]  | The list of binary media types supported by the RestApi   | No       |
+--------------------------+------------+-----------------------------------------------------------+----------+
| minimum_compression_size | 0          | Minimum response size to compress for the REST API        | No       |
+--------------------------+------------+-----------------------------------------------------------+----------+
| method                   | ANY        | The HTTP method for the REST API                          | Yes      |
+--------------------------+------------+-----------------------------------------------------------+----------+
