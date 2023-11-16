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

resource "random_id" "bucket_names" {
  count = var.bucket_count
  byte_length = 4
}

resource "aws_s3_bucket" "test_buckets" {
  count  = var.bucket_count
  bucket = "${random_id.bucket_names.*.dec[count.index]}--test-ipaas-bucket"

  tags = {
    ipaas_transfer_enabled = var.read_or_write
    yor_name               = "test_buckets"
    yor_trace              = "8e461766-a84c-408b-93c8-64b2c855e817"
    git_commit             = "c13273d184d87785ebcf4e8414e9d61183062799"
    git_file               = "tests/terraform/main.tf"
    git_last_modified_at   = "2023-11-08 12:50:23"
    git_last_modified_by   = "steven.soutar@kingfisher.com"
    git_modifiers          = "steven.soutar"
    git_org                = "group_iaas"
    git_repo               = "customer-applications/ipaas_cross_account_iam_role"
  }
}
