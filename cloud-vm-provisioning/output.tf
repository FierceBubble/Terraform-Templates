output "MasterNode-public_ip" {
  value = module.azure_vm.MasterNode-public_ip
}

output "MasterNode-private_ip" {
  value = module.azure_vm.MasterNode-private_ip
}
