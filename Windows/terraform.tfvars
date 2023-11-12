#Provider
vsphere_server = "10.10.20.4"

#Infrastructure
vsphere_datacenter = "Homelab"

#VM
vm_template_name    = "win-2019-template"
vm_vcpu             = "4"
vm_memory           = "4096"
vm_dns_servers      = ["10.10.20.5"]
vm_dns_suffix       = ["ad.matlockhome.com"]
vm_disk_label       = "disk0"
vm_disk_size        = "40"
vm_domain           = "ad.matlockhome.com"

windows_time_zone   = 04

#Domain
domainuser = "ansiblead"
