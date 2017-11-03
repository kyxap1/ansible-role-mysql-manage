SHELL=/usr/bin/env bash

.PHONY: all roles

all: validate

roles:
	@ansible-galaxy install --ignore-certs -r requirements.yml

converge:
	@ansible-playbook playbook.yml -i inventory/aws --diff --tags mysql -l bastion.tld

validate:
	@ansible-playbook playbook.yml -i inventory/aws --diff --tags mysql -l bastion.tld --check -v
