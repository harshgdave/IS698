resource "aws_s3_bucket" "lesson6_bucket" {
  bucket = "hdave-lesson6-bucket-2025-10-26"

  tags = {
    Name    = "lesson6-s3-bucket"
    Purpose = "Cloud Lab Lesson 6"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.lesson6_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.lesson6_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.lesson6_bucket.arn
}
