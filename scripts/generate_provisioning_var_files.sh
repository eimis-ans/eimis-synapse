#!/bin/bash
envsubst < "terraform/terraform.tfvars.tmpl" > terraform/terraform.tfvars
