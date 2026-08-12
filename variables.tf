variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "public_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "key_name" {
  type    = string
  default = "kp-key"
}

variable "ami" {
  type    = string
  default = "ami-0efcece6bed30fd98"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
