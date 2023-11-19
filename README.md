# Terraform vSphere VM Creation & Ansible Domain Join

## Description
This project automates the creation of virtual machines (VMs) in a VMware environment using Terraform and configures these VMs to join a domain using an Ansible playbook with realm as a SSSD wrapper. It supports both Windows and Linux VMs. Additionally, a Jenkinsfile is included for automating the process of cloning this repository and executing the Terraform and Ansible scripts.

## Demo
[Imgur](https://i.imgur.com/9qWUdNE.gifv)

## Prerequisites
* Terraform <= v1.6.1
* Ansible
* VMware vSphere environment <= 8.0.1.00000
* Jenkins with these plugins installed: Active Choices, Git

## Installation
Fork this repository.

```
git clone https://github.com/techmatlock/terraform-jenkins-vsphere-vm.git
```

1. Create a new Jenkins job
2. Give your job a name and choose "Pipeline"
3. Paste the Jenkinsfile contents into the Script section located below Pipeline.

## Usage

The Ansible playbook encrypts several files to hide sensitive variables.

These are the files that are encrypted by default:
Ansible/group_vars/all/vault
Ansible/hosts

If you want to encrypt the files, you run:

ansible-vault encrypt /path/to/file

To decrypt:

ansible-vault decrypt /path/to/file

## Configuration

![File tree](https://i.imgur.com/fkRKwn7.png)

## Contributing
Contributions to this project are welcome. Please fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.