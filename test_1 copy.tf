#provisioning AWS EC2 Instances with Terraform
provider "aws" {
region = "eu-west-2"
}

#Create EC2
resource "aws_instance" "cloud1" {
    ami = "ami-0ad8ecac8af5fc52b"
    instance_type = "t2.micro"
    count = "2"
}

