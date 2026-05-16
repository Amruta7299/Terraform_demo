# Git
git status
git add .
git commit -m "Add Terraform files"
git push origin main
git pull origin main

# AWS
aws configure
aws sts get-caller-identity
aws s3 ls

# Terraform Basic
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

# Auto approve
terraform apply -auto-approve
terraform destroy -auto-approve



# Backend commands
terraform init
terraform init -reconfigure
terraform init -migrate-state

# State commands
terraform state list
terraform state pull
terraform force-unlock <LOCK_ID>

# Remote server
ssh -i <key.pem> ec2-user@<public-ip>
sudo yum update -y
sudo yum install git unzip wget -y

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip
unzip terraform_1.8.5_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform version

# Run project on remote server
aws configure
git clone <repository-url>
cd <repository-name>
terraform init
terraform validate
terraform plan
terraform apply

# Logs
export TF_LOG=DEBUG
export TF_LOG_PATH=terraform.log
terraform plan
unset TF_LOG
unset TF_LOG_PATH
