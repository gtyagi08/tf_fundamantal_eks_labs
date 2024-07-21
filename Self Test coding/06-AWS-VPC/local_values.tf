locals {
  vpc_local_name = "${var.environment}-${var.vpc_name}"
  common_tags = {
    Owner = "Gaurav Tyagi"
    Environment = "${var.environment}"
  }
}