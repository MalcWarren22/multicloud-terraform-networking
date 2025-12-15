# Terraform AWS Variables file

variable "aws_region" {
  description = "AWS Region for Deployment"
  type        = string
}

variable "tags" {
  description = "tags for unambiguity"
  type        = map(string)
}

variable "vpc_name" {
  description = "Name AWS Virtual Private Cloud"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR Block for AWS VPC"
  type        = string
}

variable "public_subnet_name" {
  description = "AWS Public Subnet Name"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR Block for AWS Subnet"
  type        = string
}

variable "allowed_admins_cidrs" {
  description = "Allowed CIDRS for administrative access"
  type        = list(string)
}

variable "public_subnet_az" {
  description = "Availability Zone for Subnet"
  type        = string
}

variable "public_subnet_route" {
  description = "Public Subnet Route"
  type        = string
}

variable "public_subnet_ssh_port" {
  description = "SSH Port to Allow"
  type        = number
  default     = 22
}

variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 Instance"
  type        = string
}

variable "aws_ssh_public_key_path" {
  description = "Path to local SSH public key for AWS EC2"
  type = string
}