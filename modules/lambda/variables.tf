variable "function_name" {
  description = "The name of the lambda function"
}

variable "stage_name" {
  description = "The stage name)"
}

variable "runtime" {
  description = "The runtime of the lambda to create"
}

variable "memory" {
  description = "The memory size of the function"
  default     = "128"
}

variable "timeout" {
  description = "The timeout of the function"
  default     = "3"
}

variable "package" {
  description = "The package file name"
  default     = "package.zip"
}

variable "handler" {
  description = "The handler name of the lambda function"
}

variable "env" {
  description = "The list of environment variables"
  type        = "list"
}