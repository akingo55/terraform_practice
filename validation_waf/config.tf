terraform {
  backend "s3" {
    bucket  = "xxx"
    key     = "xxx"
    region  = "ap-northeast-1"
    encrypt = "true"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  version = "~> 3.24.0"
}

provider "aws" {
  alias   = "east"
  region  = "us-east-1"
  version = "~> 3.24.0"
}
