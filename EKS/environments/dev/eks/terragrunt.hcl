terraform {
  source  = "../../..//modules//terraform-aws-eks-master" # this sreuctre only fit for linux
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = "../env.hcl"
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  cluster_version                       = include.env.locals.eks_cluster_version
  cluster_name                          = include.env.locals.eks_cluster_name
  
  vpc_id                                = include.env.locals.vpc_id
  subnet_ids                            = include.env.locals.subnet_id
  
  // other optional inputs
  
  create_aws_auth_configmap             = include.env.locals.eks_create_aws_auth_configmap
  manage_aws_auth_configmap             = include.env.locals.eks_manage_aws_auth_configmap
}

