#!/bin/bash

echo "Deploying DevOps/SRE Lab Environment..."

# Initialize Terraform
terraform init

# Generate inventory file
terraform apply -auto-approve

# Run Ansible playbooksecho "Running base setup..."
ansible-playbook -i inventory/hosts.ini playbooks/base-setup.yml

echo "Setting up DevOps tools..."
ansible-playbook -i inventory/hosts.ini playbooks/devops-setup-fixed.yml

echo "Setting up SRE monitoring..."
ansible-playbook -i inventory/hosts.ini playbooks/sre-setup-fixed.yml

echo "Setting up application servers..."
ansible-playbook -i inventory/hosts.ini playbooks/apps-setup.yml

echo "Deployment complete!"
echo "Access URLs:"
echo "Jenkins: http://devops-tools:8080"
echo "Grafana: http://sre-monitoring:3000"
echo "Prometheus: http://sre-monitoring:9090"
