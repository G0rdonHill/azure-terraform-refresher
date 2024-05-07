output "az_vm_public_ip" {
  description = "The public IP from the az_vm module"
  value = module.az_vm.vm_public_ip
}

output "az_aks_client_certificate" {
  description = "az_aks module's client certificate"
  value = module.az_aks.client_certificate
  sensitive = true
}

output "az_aks_kube_config" {
  description = "az_aks module's kube config"
  value = module.az_aks.kube_config
  sensitive = true
}