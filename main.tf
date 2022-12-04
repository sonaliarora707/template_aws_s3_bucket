# provider "aws" {
#   region = "eu-central-1"
# }

# resource "aws_s3_bucket" "b" {
#   bucket = var.bucket_name
#   tags = {
#     Name        = "My-bucket-123"
#     Environment = "Dev"
#     drift_example = "v1"
#   }
# }
# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "private"
# }

# variable "bucket_name" {
  
# }

# output "bucket_drift" {
#   value = aws_s3_bucket.b
# }

provider "aws" {
  region = "eu-central-1"
}
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
variable "bucket_name" {
}
