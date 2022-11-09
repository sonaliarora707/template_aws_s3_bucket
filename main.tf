provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}
