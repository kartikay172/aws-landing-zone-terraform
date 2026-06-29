terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "aws-landing-zone"
      ManagedBy   = "terraform"
    }
  }
}

module "vpc" {
  source   = "../../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  environment = var.environment
}

module "public_subnet" {
  source                = "../../../modules/public-subnet"
  vpc_id                = module.vpc.vpc_id
  public_subnet_cidrs   = var.public_subnet_cidrs
  availability_zones    = var.aws_availability_zones
  environment           = var.environment
}

module "private_subnet" {
  source                = "../../../modules/private-subnet"
  vpc_id                = module.vpc.vpc_id
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.aws_availability_zones
  environment           = var.environment
}

module "internet_gateway" {
  source      = "../../../modules/internet-gateway"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

module "nat_gateway" {
  source            = "../../../modules/nat-gateway"
  public_subnet_id  = module.public_subnet.public_subnet_ids[0]
  environment       = var.environment
}
