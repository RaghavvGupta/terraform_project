# modules/security/outputs.tf
output "lb_security_group_id" {
  description = "The ID of the load balancer security group"
  value       = aws_security_group.lb.id
}

output "eks_security_group_id" {
  description = "The ID of the EKS security group"
  value       = aws_security_group.eks.id
}

output "db_security_group_id" {
  description = "The ID of the database security group"
  value       = aws_security_group.db.id
}

output "web_acl_id" {
  description = "The ID of the WAF Web ACL"
  value       = aws_wafv2_web_acl.main.id
}