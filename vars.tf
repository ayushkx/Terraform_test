variable "Secret_key_aws" {
        type = string
        description = "Enter the value"   
}

variable "Access_key_aws" {
        type = string
        description = "Enter the value"
     
}

variable "ami-id" {
        type = string
        description = "Enter the AMI using which you need to create an ec2 instance"
        default = "ami-084568db4383264d4"
}

variable "instance-type" {
        type = string
        description = "Enter instance type such as t2.micro"
        default = "t2.micro"
}


