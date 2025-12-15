# Terraform Azure variable declaration file
variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group to deploy resoures into"
  type        = string
}

variable "vnet_name" {
  description = "Azure Virtual Network"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR Block For Azure VNET"
  type        = string
}

variable "public_subnet_name" {
  description = "Public Subnet For Azure VNET"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR Block For Public Subnet"
  type        = string
}

variable "nsg_name" {
  description = "Azure Network Security Group"
  type        = string
}

variable "allowed_admins_cidrs" {
  description = "Allowed Administrative CIDRS for Azure VNET"
  type        = list(string)
}

variable "tags" {
  description = "Tagging for Unambiguity"
  type        = map(string)
}

variable "subscription_id" {
  description = "Subscription ID for Azure"
  type        = string
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "Username of Admin"
  type        = string
}

variable "ssh_public_key_path" {
  description = "SSH public key reference"
  type        = string
}

variable "nic_name" {
  description = "Name of the NIC"
  type        = string
}

variable "public_ip_name" {

  description = "Name of the Public IP"
  type        = string
}