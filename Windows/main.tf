#Resource
resource "vsphere_virtual_machine" "vm" {
  for_each = var.virtual_machines
  name     = each.value.name
  folder   = var.vsphere_folder

  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  num_cpus = var.vm_vcpu
  memory   = var.vm_memory

  # enable hot-add for memory and CPU
  cpu_hot_add_enabled    = true
  memory_hot_add_enabled = true

  disk {
    label            = var.vm_disk_label
    size             = data.vsphere_virtual_machine.template.disks.0.size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      windows_options {
        computer_name         = each.value.name
        admin_password        = var.vm_admin_password
        join_domain           = var.vm_domain
        domain_admin_user     = var.domainuser
        domain_admin_password = var.domainpass
        product_key           = var.windows_license_key
        time_zone             = var.windows_time_zone
      }
      network_interface {
        ipv4_address    = each.value.ip
        ipv4_netmask    = var.vm_ipv4_netmask
        dns_server_list = var.vm_dns_servers
      }
      dns_suffix_list = var.vm_dns_suffix
      ipv4_gateway    = var.vm_ipv4_gateway
    }
  }
}