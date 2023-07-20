# - - - - - Terraform Commands - - - - -
init:
	terraform init 
validate:
	terraform validate
plan:
	terraform plan
plan-no-refresh:
	terraform plan -refresh=false
apply:
	terraform apply
apply-no-refresh:
	terraform apply -refresh=false
destroy:
	terraform destroy -auto-approve
console:
	terraform console
migrate:
	terraform init -migrate-state
upgrade:
	terraform init -upgrade

# - - - - - Ansible Commands - - - - -
# Ping
ping:
	ansible all -m ping
ping-master:
	ansible master -m ping
ping-nodes:
	ansible master -m ping

# Check Version
version:
	ansible all -m shell -a "lsb_release -a"
version-master:
	ansible master -m shell -a "lsb_release -a"
version-nodes:
	ansible nodes -m shell -a "lsb_release -a"

inventory:
	ansible-inventory --graph --vars 

# Playbook
local-update-ssh-config:
	ansible-playbook ./ansible/tasks/local-update-ssh-config.yaml
update-apt:
	ansible-playbook ./ansible/tasks/update-apt.yaml