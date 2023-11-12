#Provider -  VMware vSphere Provider
variable "vsphere_user" {
  description = "vSphere username to use to connect to the environment"
}

variable "vsphere_password" {
  description = "vSphere password to use to connect to the environment"
}

variable "vsphere_server" {
  description = "vCenter server FQDN or IP"
}

# Infrastructure - vCenter / vSPhere environment
variable "vsphere_datacenter" {
  description = "vSphere datacenter in which the virtual machine will be deployed"
}

variable "vsphere_compute_cluster" {
  description = "vSPhere cluster in which the virtual machine will be deployed"
}

variable "vsphere_datastore" {
  description = "Datastore in which the virtual machine will be deployed"
}

variable "vsphere_network" {
  description = "Portgroup to which the virtual machine will be connected"
}

variable "vsphere_folder" {
  description = "vSphere folder where VMs will be added to"
  default     = ""
}

#VM
variable "vm_template_name" {
  description = "VM template with vmware-tools and perl installed"
}

variable "vm_vcpu" {
  description = "The number of virtual processors to assign to this virtual machine."
  default     = "1"
}

variable "vm_memory" {
  description = "The size of the virtual machine's memory in MB"
  default     = "1024"
}

variable "vm_ipv4_netmask" {
  description = "The IPv4 subnet mask"
}

variable "vm_ipv4_gateway" {
  description = "The IPv4 default gateway"
}

variable "vm_dns_servers" {
  description = "The list of DNS servers to configure on the virtual machine"
}

variable "vm_dns_suffix" {
  description = "Appended to the end of the host name to give the vm its FQDN"
}

variable "vm_domain" {
  description = "Domain name of virtual machine"
}

variable "virtual_machines" {
  type = map(any)
}

variable "vm_disk_label" {
  description = "Disk label of the created virtual machine"
  default = "disk0"
}

variable "vm_disk_size" {
  description = "Disk size of the created virtual machine in GB"
}


variable "windows_license_key" {
  description = "The 16-digit alphanumeric license key"
}

variable "windows_time_zone" {
  description = "Default time zone"
}

#Domain
variable "domainuser" {
  description = "Active directory domain account"
}

variable "domainpass" {
  description = "Active directory domain password"
}

variable "vm_admin_password" {
  description = "Local account admin password"
}
