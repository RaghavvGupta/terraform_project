# modules/eks/variables.tf
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "app_subnet_ids" {
  description = "List of IDs of application subnets"
  type        = list(string)
}

variable "eks_security_group_id" {
  description = "The ID of the EKS security group"
  type        = string
}

variable "eks_cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "eks_node_instance_types" {
  description = "EC2 instance types for EKS node groups"
  type        = list(string)
}

variable "eks_desired_node_count" {
  description = "Desired number of nodes in EKS node group"
  type        = number
}

variable "eks_min_node_count" {
  description = "Minimum number of nodes in EKS node group"
  type        = number
}

variable "eks_max_node_count" {
  description = "Maximum number of nodes in EKS node group"
  type        = number
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