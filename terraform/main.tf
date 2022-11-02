
resource "random_uuid" "test" {
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.root_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.root_bucket.id
  acl    = "public-read"
}
# S3 bucket for redirecting non-www to www.
resource "aws_s3_bucket" "root_bucket" {
  bucket = local.s3_bucket
  tags   = var.common_tags
  force_destroy = true
}

resource "null_resource" "s3_sync" {
  provisioner "local-exec" {
    command = "aws s3 sync ../src s3://${aws_s3_bucket.root_bucket.bucket} --acl public-read"
  }
}