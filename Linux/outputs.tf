# Generate inventory file for Ansible
resource "local_file" "ansible_inv_file" {
  content = templatefile("./hosts.tftpl",
    {
      vms = [for k, v in var.virtual_machines: v.ip]
    }
  )
  filename = "../Ansible/hosts"
}