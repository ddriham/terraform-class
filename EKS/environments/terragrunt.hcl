generate "backend" {
  path      = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "s3" {
        bucket  = "terraform-state-lidor"
        key     = "${get_parent_terragrunt_dir()}/terraform.tfstate"
        region  = "eu-central-1"
        encrypt = true
        dynamodb_table = "terraform-lock-table-lidor"
    }
}
EOF
}