variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  default     = "new-alb"
}

variable "target_group_name" {
  description = "The name of the target group"
  default     = "new-targetgroup"
}

variable "api_name" {
  description = "The name of the API Gateway"
  default     = "new-api-gateway"
}
