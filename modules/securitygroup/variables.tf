variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "app_port" {
  description = "Application port for Node.js"
  type        = number
  default     = 3000
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}