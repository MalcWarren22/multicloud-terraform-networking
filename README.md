# Multicloud Terraform Networking (AWS + Azure)

## Overview
This project implements a **fully validated dual-cloud networking environment** across **AWS and Azure** using **Terraform**. The focus is on **secure network design, access control, and real-world validation**, rather than simply provisioning resources.

The infrastructure was built, deployed, and tested end-to-end, demonstrating production-relevant cloud networking fundamentals across multiple providers.

---

## Architecture Summary

### AWS Environment
- **VPC:** `10.10.0.0/16`
- **Compute:** EC2 (Ubuntu Linux)
- **Subnet:** Public subnet with Internet Gateway routing
- **Private IP:** `10.10.0.163`
- **Public IP:** Auto-assigned (temporary)
- **Access Control:**
  - SSH restricted to allowlisted home CIDRs
  - Key-based authentication only
  - Security Groups used as the network firewall

---

### Azure Environment
- **VNet:** `10.20.0.0/16`
- **Compute:** Azure Linux Virtual Machine (Ubuntu 22.04)
- **Subnet:** Public subnet with NSG enforcement
- **Private IP:** `10.20.0.4`
- **Public IP:** Static
- **Access Control:**
  - SSH restricted to allowlisted home CIDRs
  - Key-based authentication only
  - Network Security Groups used for traffic filtering

---

## Security & Access Design
- No password-based authentication
- SSH access limited to explicitly defined source IP ranges
- No cloud API credentials stored in the repository
- SSH keys managed locally and referenced securely via Terraform
- Terraform state and secrets excluded using `.gitignore`

---

## Validation Performed
The environment was **actively validated**, not assumed to work.

- Successful SSH access to both AWS and Azure virtual machines
- Confirmation of correct private IP assignment within each CIDR block
- Verification that SSH access fails from non-allowlisted networks
- Validation of public vs. private IP behavior across both providers
- Terraform outputs confirmed against live infrastructure

---

## Technologies Used
- **Terraform**
- **AWS:** VPC, EC2, Security Groups, Internet Gateway
- **Azure:** VNet, Linux VM, Network Security Groups, Public IP
- **Linux (Ubuntu)**
- **SSH (key-based authentication)**

---

## Project Status
**Version 1 — Complete**

This release represents a **finished, functional multicloud networking implementation** with validated security and connectivity.

---

## Planned Enhancements
Future iterations may include:
- Private-only subnets with no public IP exposure
- Site-to-site VPN connectivity between AWS and Azure
- Managed access solutions (AWS SSM, Azure Bastion)
- Additional network segmentation and routing controls

---

## Why This Project Matters
This project demonstrates:
- Practical multicloud networking skills
- Secure access design following industry best practices
- Terraform used as a true source of truth
- Validation-driven infrastructure engineering
