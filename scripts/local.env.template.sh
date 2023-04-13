# configure access to S3 where tfstates are stored
export AWS_ACCESS_KEY_ID="<the access key id>"
export AWS_SECRET_ACCESS_KEY="<the secret access key>"
export AWS_S3_ENDPOINT="<the OVH s3 endpoint URL>"
export AWS_REGION="<the OVH s3 region>"
# configure access to OVH provider
export OVH_ENDPOINT="<the ovh endpoint>"
export OVH_APPLICATION_KEY="<the AK value>"
export OVH_APPLICATION_SECRET="<the AS value>"
export OVH_CONSUMER_KEY="<the CS value>"
# variables used by infrastructure components
export SERVICE_NAME="<the ID of the project on the OVH project web page>"
export CLUSTER_NAME="<name of the kubernetes cluster>"
export CLUSTER_REGION="<region of the cluster : GRA1, GRA7 ...>"
export CLUSTER_VERSION="<kubernetes version of the cluster: 1.23, 1.24, ...>"
export NODEPOOL_NAME="<Name of the node pool. '_' char is not allowed!>"
export NODEPOOL_FLAVOR="<flavor set to each node : b2-7, b2-15, R2-30, ...>"
export DNS_ZONE="<domain name : eimis.incubateur.net, eimis.fr, ...>"
export ISSUER_MAIL="<email address used for letsEncrypt/ACME registration>"
# variables used by matrix components
export SERVER_SUBDOMAIN_NAME="<the matrix serverName will be : SERVER_SUBDOMAIN_NAME.DNS_ZONE>"
export ELEMENT_SUBDOMAIN_NAME="<the front-end url will be : ELEMENT_SUBDOMAIN_NAME.DNS_ZONE>"
export SMTP_HOST="<configuration to send mail : host of the SMTP server>"
export SMTP_PORT="<configuration to send mail : port of the SMTP server>"
export SMTP_USER="<configuration to send mail : user to connect to the SMTP server>"
export SMTP_PASS="<configuration to send mail : password of connect to the SMTP server>"
export FIRST_EIMIS_USERNAME="<username of the first eimis user created when bootstraping>"
export FIRST_EIMIS_PASSWORD="<password of the first eimis user created when bootstraping>"
# variables used by matrix keycloak
export KECLOAK_DB_INSTANCE_NAME="<database name of the postgresql database linked to keycloak>"
export KEYCLOAK_DB_USER="<username to access the postgresql database linked to keycloak>"
export KEYCLOAK_DB_PASSWORD="<username to access the postgresql database linked to keycloak>"
export KEYCLOAK_CLIENT_ID="<client ID used by keycloak to identify synapse client>"
export KEYCLOAK_CLIENT_SECRET="<secret used in conjunction with client ID to identify synapse client>"
# variables used to connect to Pro Santé Connect.
# see : https://industriels.esante.gouv.fr/produits-et-services/pro-sante-connect/documentation-technique
export PROSANTE_CONNECT_ISSUER="<Used to validate tokens and to discover the Pros Santé Connect's endpoints (required but unused)>"
export PROSANTE_CONNECT_AUTHORIZATION_ENDPOINT="<Authorization endpoint used to connect to Pro Santé Connect>"
export PROSANTE_CONNECT_TOKEN_ENDPOINT="<Token endpoint used to retrieve token from Pro Santé Connect>"
export PROSANTE_CONNECT_USERINFO_ENDPOINT="<Userinfo endpoint used to retrieve info on user from Pro Santé Connect>"
export PROSANTE_CONNECT_JKWS_URI="<URI where to fetch the JWKS from Pro Santé Connect>"
export PROSANTE_CONNECT_CLIENT_ID="<Client ID used to identify the client against Pro Santé Connect>"
export PROSANTE_CONNECT_CLIENT_SECRET="<Client secret associated with client ID used to identify the client against Pro Santé Connect>"