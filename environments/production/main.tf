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
}

locals {
  common_tags = {
    Environment = var.environment
    Product     = "aws-landing-zone"
  }
}

# Elastic IPs for NAT Gateways (one per AZ)
resource "aws_eip" "nat" {
  count  = length(var.aws_availability_zones)
  domain = "vpc"
}

# VPC
module "vpc" {
  source      = "../../../modules/vpc"
  cidr        = var.vpc_cidr
  flow_logs   = false
  common_tags = local.common_tags
}

# Internet Gateway
module "internet_gateway" {
  source      = "../../../modules/internet-gateway"
  vpc_id      = module.vpc.id
  common_tags = local.common_tags
}

# Public Subnets (one per AZ)
module "public_subnet" {
  count               = length(var.aws_availability_zones)
  source              = "../../../modules/public-subnet"
  vpc_id              = module.vpc.id
  cidr_block          = var.public_subnet_cidrs[count.index]
  availability_zone   = var.aws_availability_zones[count.index]
  internet_gateway_id = module.internet_gateway.id
  common_tags         = local.common_tags
}

# NAT Gateways (one per AZ)
module "nat_gateway" {
  count             = length(var.aws_availability_zones)
  source            = "../../../modules/nat-gateway"
  public_subnet_id  = module.public_subnet[count.index].id
  eip_allocation_id = aws_eip.nat[count.index].id
  availability_zone = var.aws_availability_zones[count.index]
  common_tags       = local.common_tags
}

# Private Subnets (one per AZ)
module "private_subnet" {
  count             = length(var.aws_availability_zones)
  source            = "../../../modules/private-subnet"
  vpc_id            = module.vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.aws_availability_zones[count.index]
  nat_gateway_id    = module.nat_gateway[count.index].id
  common_tags       = local.common_tags
}
