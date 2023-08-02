# - - - - - Terraform Commands - - - - -
init:
	terraform init 
init-config:
	terraform init -backend-config=backend
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
apply-auto-approve:
	terraform apply -refresh=false -auto-approve
destroy:
	terraform destroy -auto-approve
console:
	terraform console
migrate:
	terraform init -migrate-state
upgrade:
	terraform init -upgrade
reapply:
	$(MAKE) destroy && $(MAKE) apply-auto-approve
workspace-list:
	terraform workspace list
workspace-staging:
	terraform workspace select staging
workspace-dev:
	terraform workspace select development
workspace-prod:
	terraform workspace select production
providers:
	terraform providers
