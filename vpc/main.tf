provider "aws" {
    region = var.region
    shared_config_files      = ["/home/ubuntu/.aws/config"]
    shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
    profile                  = "config"
}

terraform {
  backend "s3" {
    bucket = "terraform.tfstateoregon"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-staging"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "motogp-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "server" {
  
}