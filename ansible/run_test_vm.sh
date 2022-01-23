#!/bin/sh

set -x

usage() {
  echo "Usage: $0 [start|stop|info|login|ansible] DIST"
  exit 1
}

if [ "$#" -ne 2 ]; then usage; fi

case "$1" in
  start) cd test-vm/$2 && vagrant up && cd ../.. && ansible test -m ping ;;
   stop) cd test-vm/$2 && vagrant destroy default && cd ../.. ;;
   info) cd test-vm/$2 && vagrant global-status && vagrant ssh-config default && cd ../.. ;;
  login) cd test-vm/$2 && vagrant ssh && cd ../.. ;;
ansible) if [ ! -f "variables.yml" ]; then
           echo '1. Use `generate_passwd.sh` to generate a hashed password.'
           echo '2. Copy `variables.yml.in` into `variables.yml` and set your preferred values.'
           exit 1
         fi
         ansible-galaxy install -r requirements.yml && \
         ansible-playbook -i staging -v site.yml
         ;;
      *) usage ;;
esac
