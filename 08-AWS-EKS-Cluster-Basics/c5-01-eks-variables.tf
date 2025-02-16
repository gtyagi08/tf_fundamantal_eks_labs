variable "cluster_name" {
  description = "Name of EKS cluster"
  type = string
  default = "eksdemo"
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type = string
  default = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster"
  type = string
  default = null
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type = bool
  default = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type = bool
  default = true
}

variable "cluster_endpoint_public_access_cidr" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

#EKS Node Group Variables 
## PLaceholder space you can create if required