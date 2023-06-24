terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.2.0"
}

variable "cloudflare_api_key" {}
variable "cloudflare_email" {}
variable "aws_token" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
provider "cloudflare" {
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email
}
