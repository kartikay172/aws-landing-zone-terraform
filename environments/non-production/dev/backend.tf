terraform {
  backend "s3" {
    bucket         = "rahinfotech-terraform-state"
    key            = "non-production/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "rahinfotech-terraform-locks"
    encrypt        = true
  }
}
