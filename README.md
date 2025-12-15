## Dual-Cloud Networking Baseline (Validated)

**Status:** Locked / Known-Good

### AWS
- VPC: 10.10.0.0/16
- EC2 private IP: 10.10.0.163
- Public IP: auto-assigned (temporary)
- Access: SSH allowlisted to home IPs only

### Azure
- VNet: 10.20.0.0/16
- VM private IP: 10.20.0.4
- Public IP: static
- Access: SSH allowlisted to home IPs only

### Validation
- SSH successful to both clouds
- Private IPs confirmed
- Public access restricted via SG/NSG

**Next step:** Remove public exposure and connect via private networking (VPN).
