variable "aws_region" {
  type    = string
  default = "us-east-1"
  description = "The AWS region to deploy resources in."
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
  description = "The CIDR block for the VPC."
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
  description = "The CIDR block for the public subnet."
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
  description = "The CIDR block for the private subnet."
}

variable "public_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0" #this is replaced with my public IP 0.0.0.0/0 just for github
  description = "The CIDR block for the public SSH access."
}

variable "key_name" {
  type    = string
  default = "kp-key"
  description = "The name of the key pair."
}

variable "key_file_path" {
  type    = string
  default = "./kp.pem"
  description = "The file path for the key pair."
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
  description = "The instance type for the EC2 instances."
}
