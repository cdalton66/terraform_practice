resource "tls_private_key" "kp" {
  algorithm = "RSA"
}

resource "local_file" "kp_private" {
  content  = tls_private_key.kp.private_key_pem
  filename = var.key_file_path
}

resource "aws_key_pair" "kp_public" {
  key_name   = var.key_name
  public_key = tls_private_key.kp.public_key_openssh
}

resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.kp_public.key_name
  vpc_security_group_ids      = [var.public_sg_id]
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
}
