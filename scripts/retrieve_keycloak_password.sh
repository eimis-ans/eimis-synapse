#!/bin/bash

# this script is intended to retrieve the password linked to the admin account
# automatically created during the keycloak installation by the keycloak operator
echo "keycloak admin password = "
kubectl get secrets -n keycloak keycloak-psc-initial-admin -oyaml | grep password | sed -e "s/  password: //g" | base64 --decode
echo "\n keycloak database password = "
terraform output --raw keycloak_user_password
