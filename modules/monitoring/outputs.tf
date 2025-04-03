# modules/monitoring/outputs.tf
output "application_log_group" {
  description = "The name of the application log group"
  value       = aws_cloudwatch_log_group.application.name
}

output "cloudwatch_dashboard_name" {
  description = "The name of the CloudWatch dashboard"
  value       = aws_cloudwatch_dashboard.main.dashboard_name
}
