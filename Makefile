.PHONY: *

init:
	terraform init

plan: init
	mkdir -p ./plans
	terraform plan -out=plans/cloud.tfplan

apply: init
	terraform apply "plans/cloud.tfplan"

deploy: plan apply

destroy: init
	mkdir -p ./terraform/plans
	terraform plan -destroy -out=plans/cloud.tfplan
	terraform apply "plans/cloud.tfplan"

format:
	terraform fmt -recursive

validate: init
	terraform get -update
	terraform validate

# The following will not work when using terraform cloud remote backend
workspace:
	terraform workspace new $$TARGET

plan-trad-ws: init
	mkdir -p ./terraform/plans
	terraform workspace select $$TARGET
	terraform plan -var-file environments/$$TARGET.tfvars -out=plans/$$TARGET.tfplan

apply-trad-ws: init
	terraform apply "plans/$$TARGET.tfplan"

destroy-trad-ws: init
	mkdir -p ./terraform/plans
	terraform workspace select $$TARGET
	terraform plan -destroy -var-file environments/$$TARGET.tfvars -out=plans/$$TARGET.tfplan
	terraform apply "plans/$$TARGET.tfplan"
