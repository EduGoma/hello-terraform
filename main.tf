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
  user_data = <<EOH
  #!/bin/sh
  yum update -y
  amazon-linux-extras install -y docker
  service docker start
  systemctl enable docker
  usermod -a -G docker ec2-user
  pip3 install docker-compose
  wget  https://raw.githubusercontent.com/EduGoma/hello-2048/main/docker-compose.yaml
  mkdir /home/ec2-user/hello-2048
  chown ec2-user /home/ec2-user/hello-2048
  sudo chgrp ec2-user /home/ec2-user/hello-2048
  mv docker-compose.yaml /home/ec2-user/hello-2048/
  cd /home/ec2-user/hello-2048
  docker-compose pull
  docker-compose up -d
  EOH
}
