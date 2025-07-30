provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  tags = {
    Environment = "Dev"
    Owner       = "TerraformDemo"
  }
}