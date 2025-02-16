/*
resource "aws_eks_node_group" "eks_ng_private" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-ng-private"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets
  version = var.cluster_version #Optional default to EKS cluster
  
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  instance_types = ["t2.micro"]

  remote_access {
    ec2_ssh_key = "terraform-key"
  }
  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2

  }

  update_config {
    max_unavailable = 1
    #max_unavailable_percentage = 50   # use any one of these
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = {
    Name = "Private-node-group"
  }
}
*/