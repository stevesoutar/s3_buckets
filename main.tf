terraform {
  required_version = "~> 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "test_buckets" {
  count = 85
  bucket = "${count.index}-kxie4lidhfbgklvxbgklvjkdgowbecslvb-test-ipaas-bucket"

  tags = {
    ipaas_transfer_enabled = "read"
  }
}