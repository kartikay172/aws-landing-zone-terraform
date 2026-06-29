aws_availability_zones    = ["ap-south-1a", "ap-south-1b"]
aws_region                = "ap-south-1"
environment               = "development"
vpc_cidr                  = "10.0.0.0/16"
public_subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs      = ["10.0.11.0/24", "10.0.12.0/24"]
budget_notification_email = "your-email@example.com"
