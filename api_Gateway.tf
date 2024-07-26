resource "aws_apigatewayv2_api" "new_api_gateway" {
  name          = var.api_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "api_integration" {
  api_id           = aws_apigatewayv2_api.new_api_gateway.id
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://${aws_lb.new_alb.dns_name}"  # Reference to ALB DNS name
  integration_method = "ANY"
}

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.new_api_gateway.id
  name        = "default"
  auto_deploy = true
}

resource "aws_apigatewayv2_route" "api_route" {
  api_id    = aws_apigatewayv2_api.new_api_gateway.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.api_integration.id}"
}
