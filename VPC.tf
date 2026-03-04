module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "eks-vpc"
  cidr = "192.168.10.0/24"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["192.168.10.0/26", "192.168.10.64/26"]
  public_subnets  = ["192.168.10.128/26", "192.168.10.192/26"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
