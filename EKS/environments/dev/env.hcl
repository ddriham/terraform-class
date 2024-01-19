locals {
  env     = "dev"
  project = "terragrunt-eks"

  # EKS variables
  eks_cluster_name                    = "${local.env}-${local.project}-cluster"
  eks_cluster_version                 = "1.27"
  eks_create_aws_auth_configmap       = false
  eks_manage_aws_auth_configmap       = true
  region = "eu-west-2"
  vpc_id = "vpc-01a74fcbb64cc0b75"
  subnet_id = ["subnet-0175e2013f409f607", "subnet-07f58e08ac8ecd6c4", "subnet-0088dbf20a826a78e"]
  
  # EKS allowed users
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::343568180534:user/lidorg"
      username = "lidorg"
      groups   = ["system:masters"]
    }
  ]
  

}