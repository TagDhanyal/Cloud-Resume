# Define the S3 buckets
resource "aws_s3_bucket" "www_bucket" {
  bucket = "dhanyalresume"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 10
  }

  tags = var.common_tags
}

resource "aws_s3_bucket" "root_bucket" {
  bucket = "redirect-dhanyalresume"

  website {
    redirect_all_requests_to = "https://dhanyalresume.s3-website-${var.aws_region}.amazonaws.com"
  }

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 10
  }

  tags = var.common_tags
}

# Upload the badges to the S3 bucket then invalidate cache
resource "aws_s3_bucket_object" "images" {
  for_each = fileset("${path.module}/resume-site/images", "*.png")

  bucket       = aws_s3_bucket.www_bucket.id
  key          = "images/${each.value}"
  source       = "${path.module}/resume-site/images/${each.value}"

  content_type = "image/png"
  cache_control = "max-age=31536000, public"
}
