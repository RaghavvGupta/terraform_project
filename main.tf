# main.tf
provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = local.vpc_cidr
  availability_zones  = local.availability_zones
  public_subnet_cidrs = local.public_subnet_cidrs
  app_subnet_cidrs    = local.app_subnet_cidrs
  data_subnet_cidrs   = local.data_subnet_cidrs
  project_name        = var.project_name
  environment         = var.environment
  common_tags         = local.common_tags
}

# Security Module
module "security" {
  source = "./modules/security"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags
  domain_name  = var.domain_name
}

# Database Module
module "database" {
  source = "./modules/database"

  vpc_id               = module.vpc.vpc_id
  data_subnet_ids      = module.vpc.data_subnet_ids
  db_security_group_id = module.security.db_security_group_id
  db_instance_class    = var.db_instance_class
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  project_name         = var.project_name
  environment          = var.environment
  common_tags          = local.common_tags
}

# EKS Module
module "eks" {
  source = "./modules/eks"

  vpc_id                  = module.vpc.vpc_id
  app_subnet_ids          = module.vpc.app_subnet_ids
  eks_security_group_id   = module.security.eks_security_group_id
  eks_cluster_version     = var.eks_cluster_version
  eks_node_instance_types = var.eks_node_instance_types
  eks_desired_node_count  = var.eks_desired_node_count
  eks_min_node_count      = var.eks_min_node_count
  eks_max_node_count      = var.eks_max_node_count
  project_name            = var.project_name
  environment             = var.environment
  common_tags             = local.common_tags
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"

  vpc_id           = module.vpc.vpc_id
  eks_cluster_name = module.eks.cluster_name
  rds_instance_id  = module.database.rds_instance_id
  project_name     = var.project_name
  environment      = var.environment
  common_tags      = local.common_tags
}

# Load Balancer Module
module "load_balancer" {
  source = "./modules/load_balancer"

  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.vpc.public_subnet_ids
  lb_security_group_id = module.security.lb_security_group_id
  domain_name          = var.domain_name
  project_name         = var.project_name
  environment          = var.environment
  common_tags          = local.common_tags
}