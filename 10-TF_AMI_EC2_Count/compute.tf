// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "server_ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
      name = "owner-alias"
      values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*-x86_64-gp2"]
  }
}

// Resource referencing from another file i.e networking.tf
resource "aws_instance" "terraform_test_ec2" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id
  key_name      = var.instance_key_name
  tags = {
    Name = "terraform_test_ec2_${count.index}"
  }

  user_data  = <<-EOF
    #! /bin/bash
    yum update -y
    yum install httpd -y
    EOF

  vpc_security_group_ids = [aws_security_group.terraform_test_sg.id]
  # Resource Referencing done from a different .tf
  subnet_id              = aws_subnet.terraform_public_test_subnet[0].id
  root_block_device {
    volume_size = var.vol_size
  }
}