output "Azure-VM-public_ip" {
  value = module.azure.MasterNode-public_ip
}

output "Azure-VM-private_ip" {
  value = module.azure.MasterNode-private_ip
}
