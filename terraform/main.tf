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
  count  = 25
  bucket = "${count.index}-kxie4lidhfbgklvxbgklvjkdgowbecslvb-test-ipaas-bucket"

  tags = {
    ipaas_transfer_enabled = "read"
    git_commit             = "1c756c3b2444c189903d55ed24f63add97fbf1f8"
    git_file               = "terraform/main.tf"
    git_last_modified_at   = "2023-11-06 19:37:12"
    git_last_modified_by   = "steven.soutar@kingfisher.com"
    git_modifiers          = "steven.soutar"
    git_org                = "stevesoutar"
    git_repo               = "s3_buckets"
    yor_name               = "test_buckets"
    yor_trace              = "a73385bc-8d3d-451c-a4dc-b0dbc1c7daa6"
  }
}
