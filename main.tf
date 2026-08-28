# Root module wiring providers and submodules
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "tls" {}

provider "local" {}

# AMI data source for Ubuntu 22.04 (Jammy)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "security" {
  source          = "./modules/security"
  vpc_id          = module.network.vpc_id
  public_ssh_cidr = var.public_ssh_cidr
}

module "bastion" {
  source          = "./modules/bastion"
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  key_file_path   = var.key_file_path
  public_sg_id    = module.security.public_sg_id
  public_subnet_id = module.network.public_subnet_id
}

module "compute" {
  source            = "./modules/compute"
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = module.bastion.key_name
  private_sg_id     = module.security.private_sg_id
  private_subnet_id = module.network.private_subnet_id
}
