resource "aws_key_pair" "my_key" {
    key_name = "terra-key"
    public_key = file("terra-key.pub")
    }

resource "aws_default_vpc" "default" {

    }

resource "aws_security_group" "my_security_group" {
    name        = "my_security_group"
    description = "Allow SSH and HTTP traffic"
    vpc_id      = aws_default_vpc.default.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow SSH access from anywhere"

}
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow HTTP access from anywhere"
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow all outbound traffic"
    }
}

resource "aws_instance" "Ubuntu" {
        ami = var.ec2_ami
        key_name = aws_key_pair.my_key.key_name
        security_groups = [aws_security_group.my_security_group.name]
        instance_type = "t2.micro"
        user_data = file("install_apps.sh ")
        root_block_device {
          volume_size = 8
          volume_type = "gp3"
        }

        tags = {
          name = "terra_ubuntu"
        }

}