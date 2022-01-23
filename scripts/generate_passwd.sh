#!/bin/sh

echo -n 'Password: '
read -s password
echo
ansible all -i localhost, -m debug -a "msg={{ '$password' | password_hash('sha512', 'mysecretsalt') }}"
