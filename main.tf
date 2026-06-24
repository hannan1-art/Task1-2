
# Default VPC 
data "aws_vpc" "default" {
  default = true
}

# Default Subnets (for EC2 )
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


# Security Group Module
module "securitygroup" {
  source = "./modules/securitygroup"

  name   = "node-app-sg"
  vpc_id = data.aws_vpc.default.id

  app_port = var.app_port
}

# EC2 Module (Node.js app on Docker)
module "ec2" {
  source = "./modules/ec2"

  name              = "node-app-instance"
  instance_type     = var.instance_type
  subnet_id         = data.aws_subnets.default.ids[0]
  security_group_id = module.securitygroup.security_group_id
  app_port          = var.app_port
}