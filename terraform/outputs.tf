output "s3_domain" {
  description = "The domain of the website endpoint. This is used to create Route 53 alias records."
  value       = aws_s3_bucket_website_configuration.example.website_domain
}
output "s3_website" {
  description = "The domain of the website endpoint. This is used to create Route 53 alias records."
  value       = aws_s3_bucket_website_configuration.example
}