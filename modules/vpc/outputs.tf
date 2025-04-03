# modules/vpc/outputs.tf
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "app_subnet_ids" {
  description = "List of IDs of application subnets"
  value       = aws_subnet.app[*].id
}

output "data_subnet_ids" {
  description = "List of IDs of data subnets"
  value       = aws_subnet.data[*].id
}