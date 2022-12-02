provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "sg-snail-123"
  tags = {
    Name        = "My-bucket-123"
    Environment = "Dev"
    drift_example = "v1"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.b
}
