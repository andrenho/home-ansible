#!/bin/sh

set -x

usage() {
  echo "Usage: $0 [start|stop|info|login|ansible] DIST"
  exit 1
}

if [ "$#" -ne 2 ]; then usage; fi

case "$1" in
  start) cd test-vm/$2 && VAGRANT_EXPERIMENTAL="disks" vagrant up && cd ../.. && ansible -i testing server -m ping ;;
   stop) cd test-vm/$2 && vagrant destroy default && cd ../.. ;;
   info) cd test-vm/$2 && vagrant global-status && vagrant ssh-config default && cd ../.. ;;
  login) cd test-vm/$2 && vagrant ssh && cd ../.. ;;
ansible) ansible-galaxy install -r requirements.yml && \
         ansible-playbook --vault-password-file ~/.vault_pass.txt -i testing -v site.yml
         ;;
      *) usage ;;
esac
