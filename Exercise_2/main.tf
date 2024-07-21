# AWS credentials will be obtained from the credential file in the .aws folder
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

# Lambda
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "udacity_lambda" {
  name               = "udacity_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.lambda_file
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "greet" {
  filename      = data.archive_file.lambda.output_path
  function_name = var.function_name
  role          = aws_iam_role.udacity_lambda.arn
  handler       = var.lambda_handler

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"

  environment {
    variables = {
      tag = "Udacity"
    }
  }
}