#!/bin/bash

echo "Running Terraform logging and alerting setup..."
terraform apply -auto-approve terraform/

echo "Running Ansible playbook for logging and alerting configuration..."
ansible-playbook ansible/playbook.yml
