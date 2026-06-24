Task2 

This project automates AWS infrastructure deployment using Terraform and GitHub Actions with secure OIDC-based authentication.This workflow is built on top of Task1 in which i made a minial node app aand run it locally but now I automates it using github actions


Pipeline Steps
Code is pushed to GitHub (main branch)
GitHub Actions workflow is triggered automatically
AWS authentication is performed using OIDC (GitHub AWS IAM Role assumption, no static keys)
TFLint runs to check Terraform code quality and best practices
Terraform is initialized (terraform init)
Code formatting is checked (terraform fmt check)
Configuration is validated (terraform validate)
Execution plan is generated (terraform plan)
Infrastructure changes are applied (terraform apply -auto-approve)

Why OIDC is used:
OIDC is used to securely connect GitHub Actions with AWS without storing longterm AWS access keys in the repository.
Instead, GitHub requests a shortlived token, and AWS temporarily assumes the IAM role to perform actions.
This improves security by removing hardcoded credentials and reducing the risk of key leakage.