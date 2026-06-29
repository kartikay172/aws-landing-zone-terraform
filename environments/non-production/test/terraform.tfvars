aws_availability_zones    = ["ap-south-1a", "ap-south-1b"]
aws_region                = "ap-south-1"
environment               = "test"
vpc_cidr                  = "10.2.0.0/16"
public_subnet_cidrs       = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs      = ["10.2.11.0/24", "10.2.12.0/24"]
budget_notification_email = "kartikay.m@rahinfotech.com"
budget_limit              = "100"
