#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
echo "Terraform provisioned this server!" | sudo tee /var/www/html/index.html