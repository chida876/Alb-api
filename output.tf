output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.new_alb.dns_name
}

output "api_endpoint" {
  description = "The endpoint URL for the API Gateway"
  value       = aws_apigatewayv2_api.new_api_gateway.api_endpoint
}
