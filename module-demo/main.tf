module "kms" {
  
    source ="./module_kms"
    alias = "alias/ec2key"
    description = "EC2 Instance Encrypt Key"
    deletion_window_in_days = 10
  
}