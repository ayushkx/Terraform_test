terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "<5.94.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
 access_key = Access_key_aws
  secret_key = Secret_key_aws
}

resource "aws_instance" "RHEL_AMI" {
        ami = "ami-0c15e602d3d6c6c4a"
        instance_type = "t2.micro"
        availability_zone = "us-east-1a"
        key_name = "ayush_terraform"
        tags = {
                Name = "RHEL_AMI"
}
}




