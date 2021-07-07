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

# Creation of S3 public and private buckets 
resource "aws_s3_bucket" "cloud1" {
  bucket = "motivateam4media"
  acl    = "public-read"

}


resource "aws_s3_bucket" "cloud1_bkp" {
  bucket = "cloud14bkp"
  acl    = "private"
}


resource "aws_s3_bucket_policy" "cloud1" {
  bucket = "cloud1media"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "cloud1_policy",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
    "Principal": "*",
      "Action": [
          "s3:GetObject"
          ],
      "Resource":[
          "arn:aws:s3:::cloud1edia/*"
      ]
    }
  ]
}
POLICY
}