output "ec2_bastion_public_instance_ids" {
  description = "ID of instances"
  value = module.ec2_public.id
}

output "ec2_bastion_eip" {
  description = "eip IP"
  value = aws_eip.bastion_eip.public_ip
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}