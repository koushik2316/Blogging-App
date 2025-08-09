variable "aws_region" {
  description = "The AWS region to deploy the EKS cluster"
  type        = string
  default     = "ap-south-1"

}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

}

variable "ec2_ssh_key" {
  description = "The name of the EC2 SSH key pair"
  type        = string
  default     = "Mumbai"
}
