#!/bin/bash
ansible-playbook --private-key ~/.ssh/id_rsa \
  -u ubuntu \
  -i hosts \
  playbook.yml
