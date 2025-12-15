# AWS networking resources for multicloud dev environment

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name = var.vpc_name
    }
  )
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_subnet_az
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = var.public_subnet_name
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.public_subnet_route
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.vpc_name}-public-rt"
    }
  )
}

resource "aws_route_table_association" "routeassociation" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.routetable.id
}

resource "aws_security_group" "ssh_sg" {
  name        = "${var.vpc_name}-ssh-sg"
  description = "Allow SSH from admin CIDRs"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "SSH"
    from_port   = var.public_subnet_ssh_port
    to_port     = var.public_subnet_ssh_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_admins_cidrs
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
  Name = "${var.vpc_name}-ssh-sg" })
}

resource "aws_instance" "EC2" {
  ami                         = var.ec2_ami_id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.subnet.id
  vpc_security_group_ids      = [aws_security_group.ssh_sg.id]
  key_name                    = aws_key_pair.multicloud.key_name
  associate_public_ip_address = true

  tags = merge(
    var.tags,
    {
  Name = "${var.vpc_name}-ec2" })
}


resource "aws_key_pair" "multicloud" {
  key_name = "multicloud-key"
  public_key = file(var.aws_ssh_public_key_path)

  tags = merge(var.tags, { Name = "multicloud-key"})
}

