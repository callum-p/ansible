#!/bin/bash

if [ "$1" == "" ]; then
  echo 'Missing git commit hash'
else
  sed -e s/%hash%/$1/g /root/ansible/include/template.yml > /root/ansible/include/vars.yml
  ansible-playbook launchconfig.yml -vvvv
  ansible-playbook asg.yml -vvvv
fi
