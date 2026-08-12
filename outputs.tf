output "bastion_public_ip" {
  value = module.compute.bastion_public_ip
}

output "ec2_instance_id" {
  value = module.compute.ec2_instance_id
}

output "key_pair_name" {
  value = module.keypair.key_name
}
