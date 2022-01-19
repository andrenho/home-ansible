#!/bin/sh

set -x

usage() {
  echo "Usage: $0 [start|stop|info|login] DIST"
  exit 1
}

if [ "$#" -ne 2 ]; then usage; fi

case "$1" in
  start) cd test-vm/$2 && vagrant up && cd ../.. ;;
   stop) cd test-vm/$2 && vagrant destroy default && cd ../.. ;;
   info) cd test-vm/$2 && vagrant global-status && cd ../.. ;;
  login) cd test-vm/$2 && vagrant ssh && cd ../.. ;;
      *) usage ;;
esac
