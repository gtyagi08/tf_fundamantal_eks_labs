module "public_bastian_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "5.1.2"

  name        = "${local.name}-public-bastian-sg"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  #Ingress rules and CIDR blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  #egress rules and CIDR blocks
  egress_rules = ["all-all"]
  tags = local.common_tags
}