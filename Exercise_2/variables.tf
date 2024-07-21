# TODO: Define the variable for aws_region
variable "lambda_file" {
  type    = string
  default = "greet_lambda.py"
}

variable "lambda_handler" {
  type    = string
  default = "lambda_handler"
}

variable "function_name" {
  type    = string
  default = "greet_lambda"
}