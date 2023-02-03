#!/bin/bash
envsubst < "terraform.tfvars.tmpl" > terraform.tfvars
cat terraform.tfvars