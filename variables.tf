variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the Node.js application"
  type        = string
  default     = "t3.micro"
}

variable "app_port" {
  description = "Port on which Node.js application will run"
  type        = number
  default     = 3000
}