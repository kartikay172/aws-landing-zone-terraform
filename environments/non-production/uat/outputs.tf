output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = [for s in module.public_subnet : s.id]
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = [for s in module.private_subnet : s.id]
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.internet_gateway.id
}

output "nat_gateway_ids" {
  description = "NAT Gateway IDs"
  value       = [for n in module.nat_gateway : n.id]
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}
