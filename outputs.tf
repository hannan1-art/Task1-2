output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "application_url" {
  description = "URL to access the Node.js application"
  value       = "http://${module.ec2.public_ip}:${var.app_port}"
}