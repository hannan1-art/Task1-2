Infrastructure Provisioning Task 1:

This project provisions a simple web application stack on AWS using Terraform. It deploys a Node.js application running inside a Docker container on an EC2 instance.

Architecture:
Default AWS VPC is used
One EC2 instance runs the application
Security group allows SSH and application access on port 3000
Node.js app runs inside a Docker container
Infrastructure is fully provisioned using Terraform



Design decisions:

EC2 was used instead of ECS because this is a single instance deployment and does not require orchestration or multi service scaling.

Docker is used to run the Node.js application to keep the runtime consistent and easy to manage.

Default VPC is used to avoid unnecessary networking setup and keep the deployment minimal.

Security group is configured only for required access: SSH for management and port 3000 for the application.

SSH is open for simplicity but should normally be restricted to specific IP addresses.

Application deployment:

The sample Node.js application is generated during instance initialization using EC2 user data rather than being stored in a separate application directory. This keeps the repository focused on infrastructure provisioning while ensuring the application is deployed automatically as part of the infrastructure lifecycle.
For a larger application, the source code would typically be maintained in a separate repository or application directory and deployed through a CI/CD pipeline.

Prerequisites:
AWS account with credentials configured
Terraform installed
AWS CLI configured


How to deploy?

Initialize Terraform

terraform init

Review plan

terraform plan

Deploy infrastructure

terraform apply

Output:
After deployment, Terraform will output:
instance_public_ip
application_url
Example:
http://<public-ip>:3000
Open the URL in a browser to access the application or we can test in terminal using curl.

Cleanup

terraform destroy


Note:
This setup is intentionally minimal and can be extended with load balancers, ECS, monitoring, remote statefile or CI/CD pipelines if required

Future Improvements

Remote Terraform state using S3 and DynamoDB
Dedicated VPC with public and private subnets
HTTPS using ACM and an Application Load Balancer
CI/CD pipeline for automated deployments
Monitoring and alerting with CloudWatch
ECS/Fargate for container orchestration