module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  name = "${local.name}-BastionHost"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  #monitoring             = true
  vpc_security_group_ids = [module.public_bastian_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  
  tags = local.common_tags
}