
########## AWS S3 provider ############
# provider "aws" {
#   region = "eu-central-1"
# }
# resource "aws_s3_bucket" "b" {
#   bucket = var.bucket_name
#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }
# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "private"
# }
# variable "bucket_name" {
# }

########## AWS VPC provider ############
# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Owner = "stackguardian"
#   }
# }

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = base64sha256("lambda_function_payload.zip")

  runtime = "nodejs16.x"
  tags = {
    Name = "efs_for_lambda"
  }

  environment {
    variables = {
      foo = "bar"
    }
  }
}
