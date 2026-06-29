terraform {
  backend "s3" {
    bucket       = "rahinfotech-terraform-state"
    key          = "production/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}
