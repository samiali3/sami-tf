terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "samitest-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Sami"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

