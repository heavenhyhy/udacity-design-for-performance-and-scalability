# TODO: Define the output variable for the lambda function.
output "lambda_function_arn" {
  description = "The ARN of the Udacity Lambda Function we just deployed"
  value       = aws_lambda_function.greet.arn
}