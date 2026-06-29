aws_availability_zones    = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
aws_region                = "ap-south-1"
environment               = "production"
vpc_cidr                  = "10.10.0.0/16"
public_subnet_cidrs       = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
private_subnet_cidrs      = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
budget_notification_email = "kartikay.m@rahinfotech.com"
budget_limit              = "500"
