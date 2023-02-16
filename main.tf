terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"
}
provider "aws" {
  region = "eu-west-1"
}
resource "aws_instance" "app_server" {
  ami                    = "ami-0b752bf1df193a6c4"
  instance_type          = "t2.micro"
  key_name               = "clave-lucatic"
  subnet_id              = "subnet-00ce9b5739c0bcabe"
  vpc_security_group_ids = ["sg-068c536b23394be69"]
  tags = {
    Name = var.instance_name
    APP  = "vue2048"
  }
}
