#!/bin/bash

# this script is intended to retrieve the password linked to the admin account
# automatically created during the keycloak installation by the keycloak operator
echo "keycloak admin password = $(kubectl get secret -n keycloak keycloak-eimis-initial-admin -o json | jq -r '.data.password' | base64 -d)"

