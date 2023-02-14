#!/bin/bash
envsubst < "terraform.tfvars.tmpl" > terraform.tfvars
envsubst < "ansible/group_vars/env_vars.tmpl" > ansible/group_vars/all.yml