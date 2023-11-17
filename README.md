# Terraform vSphere VM Creation & Ansible Domain Join

## Description
This project automates the creation of virtual machines (VMs) in a VMware environment using Terraform and configures these VMs to join a domain using an Ansible playbook. It supports both Windows and Linux VMs. Additionally, a Jenkinsfile is included for automating the process of cloning this repository and executing the Terraform and Ansible scripts.

## Prerequisites
* Terraform
* Ansible
* VMware vSphere environment
* Jenkins with Terraform and Ansible plugins installed

## Installation
Fork this repository if using GitHub.  Or clone to your local machine and push to your remote repository.

```
git clone https://github.com/techmatlock/terraform-jenkins-vsphere-vm.git
```

## Usage

Navigate to the Terraform directory and initialize the Terraform environment:

## Configuration

![File tree](https://i.imgur.com/aGO3pb8.png)

## Contributing
Contributions to this project are welcome. Please fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.