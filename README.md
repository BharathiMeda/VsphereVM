Terraform vSphere VM Creation & Ansible Domain Join
Description
This project automates the creation of virtual machines (VMs) in a VMware environment using Terraform and configures these VMs to join a domain using an Ansible playbook. It supports both Windows and Linux VMs. Additionally, a Jenkinsfile is included for automating the process of cloning this repository and executing the Terraform and Ansible scripts.

Prerequisites
Terraform
Ansible
VMware vSphere environment
Jenkins with Terraform and Ansible plugins installed

Installation
Clone this repository to your local machine using:
```
git clone https://github.com/your-username/your-repo-name.git
```

Usage
Terraform
Navigate to the Terraform directory and initialize the Terraform environment:

bash
Copy code
cd terraform
terraform init
To create VMs, execute:

Copy code
terraform apply
Ansible
After VM creation, run the Ansible playbook to join the VMs to the domain:


Copy code
ansible-playbook -i inventory playbook.yml
Jenkins Automation
The included Jenkinsfile can be used to automate the above processes. Ensure your Jenkins pipeline is configured to use this file.

Configuration
Configure Terraform scripts in the /terraform directory.
Update Ansible playbook in the /ansible directory as per your domain requirements.
Modify Jenkinsfile if needed, located at the root of this repository.
Contributing
Contributions to this project are welcome. Please fork the repository and submit a pull request.

License
This project is licensed under the MIT License.