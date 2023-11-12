#Resource
resource "vsphere_virtual_machine" "vm" {
  for_each = var.virtual_machines
  name     = each.value.name
  folder   = var.vsphere_folder

  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  firmware         = data.vsphere_virtual_machine.template.firmware

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
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.value.name
        domain    = var.vm_domain
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