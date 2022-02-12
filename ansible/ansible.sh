#!/bin/sh

ansible-galaxy install -r requirements.yml
ansible-playbook --vault-password-file ~/.vault_pass.txt -i production -v site.yml $@
