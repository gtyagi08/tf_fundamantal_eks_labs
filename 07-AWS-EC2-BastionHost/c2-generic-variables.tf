#Aws region
variable "aws_region" {
  description = "Regions in which aws region resources are to be created"
  type = string
  default = "us-west-1"
}

# Environment variable
variable "environment" {
  description = "Environment variable used as prefix"
  type = string
  default = "dev"
}

#Business division
variable "business_division" {
  description = "Business division in the large org this into"
  type = string
  default = "HR"
}
