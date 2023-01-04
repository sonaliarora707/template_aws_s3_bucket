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


resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
