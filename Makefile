SHELL=/usr/bin/env bash

.PHONY: all roles converge validate

all: validate

roles:
	@ansible-galaxy install --ignore-certs -r requirements.yml

converge:
	@ansible-playbook site.yml -i inventory/aws.cfg --diff --tags mysql

validate:
	@ansible-playbook site.yml -i inventory/aws.cfg --diff --tags mysql --check -vv
