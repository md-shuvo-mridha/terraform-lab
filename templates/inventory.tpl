[devops_servers]
devops-tools ansible_host=${devops_ip} ansible_user=root

[sre_servers]
sre-monitoring ansible_host=${sre_ip} ansible_user=root

[rocky_servers]
rocky-app-01 ansible_host=${rocky_01_ip} ansible_user=root
rocky-app-02 ansible_host=${rocky_02_ip} ansible_user=root

[applications:children]
rocky_servers

[monitoring:children]
sre_servers

[tools:children]
devops_servers

[all:vars]
ansible_ssh_private_key_file=~/.ssh/terraform-master
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_python_interpreter=/usr/bin/python3
