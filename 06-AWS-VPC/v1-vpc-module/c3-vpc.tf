#Create VPC Terraform module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  #VPC Basic details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24" ]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24" ]
  
  #Database subnet
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  #create_database_nat_gateway_route = false
  #create_database_internet_gateway_route = false
  database_subnets  = ["10.0.151.0/24", "10.0.152.0/24" ]

  #Nat gateway for private subnet
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  #VPC DNS Parameters
  enable_dns_hostnames =  true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }

  tags = {
    Owner = "Gaurav"
    Environment = "dev"
  }
}

