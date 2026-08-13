resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.private_sg_id]
  subnet_id              = var.private_subnet_id
}

