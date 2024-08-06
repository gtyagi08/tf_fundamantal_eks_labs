#EKS Cluster Outputs
output "cluster_id" {
  description = "Name/id of EKS Cluster"
  value = aws_eks_cluster.eks_cluster.id
}

output "Cluster_arn" {
  description = "arn of EKS Cluster"
  value = aws_eks_cluster.eks_cluster.arn
}

output "cluster_certificate_authority_data" {
  description = "Nested attributes containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "Endpoint of EKS kubernetes API"
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_version" {
  description = "cluster version of EKS CLuster"
  value = aws_eks_cluster.eks_cluster.version
}

output "cluster_security_group_id" {
  description = "SG Attached to EKS Cluster"
  value = [aws_eks_cluster.eks_cluster.vpc_config[0].security_group_ids]

}

output "cluster_iam_role_name" {
  description = "IAM Role of EKS cluster"
  value = aws_iam_role.eks_master_role.name
}

output "cluster_iam_role_arn" {
  description = "IAM Role arn of EKS cluster"
  value = aws_iam_role.eks_master_role.arn
}

output "cluster_oidc_issuer_url" {
  description = "URL on the EKS Cluster IODC Issuer"
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

#EKS Node Group output - Public
output "node_group_public_id" {
  description = "Public Node Group id"
  value = aws_eks_node_group.eks_ng_public.id
}

output "node_group_public_arn" {
  description = "Public Node Group ARN"
  value       = aws_eks_node_group.eks_ng_public.arn
}

output "node_group_public_status" {
  description = "Public Node Group status"
  value       = aws_eks_node_group.eks_ng_public.status 
}

output "node_group_public_version" {
  description = "Public Node Group Kubernetes Version"
  value       = aws_eks_node_group.eks_ng_public.version
}

# EKS Node Group Outputs - Private
/*
output "node_group_private_id" {
  description = "Node Group 1 ID"
  value       = aws_eks_node_group.eks_ng_private.id
}

output "node_group_private_arn" {
  description = "Private Node Group ARN"
  value       = aws_eks_node_group.eks_ng_private.arn
}

output "node_group_private_status" {
  description = "Private Node Group status"
  value       = aws_eks_node_group.eks_ng_private.status 
}

output "node_group_private_version" {
  description = "Private Node Group Kubernetes Version"
  value       = aws_eks_node_group.eks_ng_private.version
}
*/