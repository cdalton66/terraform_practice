#Allows other modules to access data
output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "ec2_instance_id" {
  value = module.compute.ec2_instance_id
}

output "key_pair_name" {
  value = module.bastion.key_name
}
