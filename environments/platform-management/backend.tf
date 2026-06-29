terraform {
  backend "s3" {
    bucket         = "rahinfotech-terraform-state"
    key            = "platform-management/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "rahinfotech-terraform-locks"
    encrypt        = true
  }
}
