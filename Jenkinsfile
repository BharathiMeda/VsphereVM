pipeline {
    agent any
    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }
    
    stages {
        stage('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Git Checkout') {
            steps {
                git credentialsId: '8e5a90a7-d8c8-4a86-8d94-1377d98937c7', url: 'ssh://git@github.com/techmatlock/terraform-jenkins-vsphere-vm.git'
            }
        }
        stage('Deploy Terraform') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'fa0cdf88-8389-4964-bd69-5f779c57de90', passwordVariable: 'TF_VAR_vsphere_user', usernameVariable: 'TF_VAR_vsphere_password')]) {
                    //     string(credentialsId: '6c8b9d82-e08c-41f6-8c28-1069dc6ebd15', variable: 'TF_VAR_vm_admin_password'),
                    //     string(credentialsId: '7772736e-92df-4869-a758-a73d0acac951', variable: 'TF_VAR_domainpass')
                    //     ]) 
                        if (params.VSPHERE_NETWORK == "VM Network") {
                            VSPHERE_NETMASK = "24"
                            VSPHERE_GATEWAY = "10.10.20.1"
                        }
                        if (params.OS_CHOICE == "LINUX") {
                            dir('Linux') {
                                sh """
                                    terraform init
                                    terraform plan -var 'vm_domain=${params.DOMAIN}' \
                                                   -var 'vsphere_network=${params.VSPHERE_NETWORK}' \
                                                   -var 'vm_ipv4_netmask=$VSPHERE_NETMASK' \
                                                   -var 'vm_ipv4_gateway=$VSPHERE_GATEWAY' \
                                                   -var 'vsphere_datastore=${params.DATASTORE}' \
                                                   -var 'vsphere_folder=${params.ROOT_FOLDER}' \
                                                   -var 'virtual_machines={vm1: {name: "${params.VM_NAME1}", ip: "${params.IP1}"}}' -out myplan
                                    terraform apply --auto-approve myplan
                                """
                            }
                        } else if (params.OS_CHOICE == "WINDOWS") {
                            dir('Windows') {
                                sh """
                                    terraform init
                                    terraform plan -var 'vm_domain=${params.DOMAIN}' \
                                                   -var 'vsphere_network=${params.VSPHERE_NETWORK}' \
                                                   -var 'vm_ipv4_netmask=$VSPHERE_NETMASK' \
                                                   -var 'vm_ipv4_gateway=$VSPHERE_GATEWAY' \
                                                   -var 'vsphere_compute_cluster=${params.COMPUTE_CLUSTER}' \
                                                   -var 'vsphere_datastore=${params.DATASTORE}' \
                                                   -var 'vsphere_folder=${params.ROOT_FOLDER}' \
                                                   -var 'virtual_machines={vm1: {name: "${params.VM_NAME1}", ip: "${params.IP1}"}}' -out myplan
                                    terraform apply --auto-approve myplan
                                """
                            }
                        }
                    }
                }
            }
        }
        stage("Ansible Decrypt & Run Realm Playbook") {
            when {
                expression {
                    params.OS_CHOICE == "LINUX"
                }
            }
            steps {
                withCredentials([file(credentialsId: 'cfd28f5b-2c72-49f1-b826-e48e27e88374', variable: 'my_vault_file')]) {
                    script {
                        if (params.DOMAIN == "ad.matlockhome.com") {
                            //my_vault_file is a Jenkins credential that contains the plaintext password, which is used by Ansible to decrypt vault file
                            sh """
                                (cd Ansible; ansible-playbook -i ./hosts --vault-password-file "${my_vault_file}" ./playbooks/install_all.yml")
                            """ 
                        }
                    }
                }    
            } 
        }
    }   
}
