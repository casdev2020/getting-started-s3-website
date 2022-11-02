variable "common_tags" {
  description = "Common tags you want applied to all components."
  default={
    project = "getting-started-s3-website"
  }
}
locals {
  s3_bucket = "${random_uuid.test.result}-bucket"
}