# Terraform AWS outputs file

output "ec2_public_ip" { value = aws_instance.EC2.public_ip }
output "ec2_public_dns" { value = aws_instance.EC2.public_dns }


