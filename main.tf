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
 access_key = “YOUR_ACCESS_KEY”
  secret_key = "YOUR_SECRET_KEY"
}

resource "aws_instance" "swanand-instance" {
        ami = var.ami-id
        instance_type = var.instance-type
        availability_zone = var.az
        key_name = "ayush_terraform"
        tags = {
                Name = var.instance-name
}
}




