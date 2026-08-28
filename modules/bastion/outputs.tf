output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "key_name" {
  value = aws_key_pair.kp_public.key_name
}
