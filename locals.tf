# locals.tf
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }

  # VPC CIDR blocks
  vpc_cidr           = var.vpc_cidr
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]


  # Subnet calculations
  public_subnet_cidrs = [cidrsubnet(var.vpc_cidr, 4, 0), cidrsubnet(var.vpc_cidr, 4, 1), cidrsubnet(var.vpc_cidr, 4, 2)]
  app_subnet_cidrs    = [cidrsubnet(var.vpc_cidr, 4, 3), cidrsubnet(var.vpc_cidr, 4, 4), cidrsubnet(var.vpc_cidr, 4, 5)]
  data_subnet_cidrs   = [cidrsubnet(var.vpc_cidr, 4, 6), cidrsubnet(var.vpc_cidr, 4, 7), cidrsubnet(var.vpc_cidr, 4, 8)]
}