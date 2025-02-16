vpc_name = "myvpc"
vpc_cidr = "10.0.0.0/16"   
availability_zones  = ["us-east-1a", "us-east-1b"]
private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]
database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]
environment = "staging"