terraform {
  source = "..\\..\\..\\modules\\terraform-aws-vpc-master"
  

}


locals {
  region = "eu-west-2"
  env   = "dev"
}


inputs = {
  name = "${local.env}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "${local.env}"
}
}