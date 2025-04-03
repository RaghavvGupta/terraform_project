# modules/database/variables.tf
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "data_subnet_ids" {
  description = "List of IDs of data subnets"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "The ID of the database security group"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}