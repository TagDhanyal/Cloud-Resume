# Output the Invoke URL of the API Gateway
output "api_gateway_invoke_url" {  
  description = "The URL of the AWS API Gateway endpoint to be used in tests and website."
  value = aws_apigatewayv2_stage.example.invoke_url
}

output "S3_BUCKET" {
  description = "The name of the AWS S3 bucket where website files will be synced."
  value       = aws_s3_bucket.www_bucket.id
}

output "CLOUDFRONT_DISTRIBUTION_ID" {
  value = aws_cloudfront_distribution.root_s3_distribution.id
}