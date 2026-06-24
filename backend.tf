terraform {
  backend "s3" {
    bucket         = "remote-state-terraform-demo-test"
    key            = "task1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}