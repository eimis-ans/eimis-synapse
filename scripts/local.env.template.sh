# Used only for local execution and not with CI
export ENVIRONMENT="<the name of the environment you want to build from the local machine>"

#################################################
# Template file coming from https://github.com/ovh/public-cloud-examples/blob/main/basics/ovhrc.template
#### Openstack vars from openrc file
export OS_AUTH_URL=https://auth.cloud.ovh.net/v3
export OS_IDENTITY_API_VERSION=3
export OS_USER_DOMAIN_NAME=${OS_USER_DOMAIN_NAME:-"Default"}
export OS_PROJECT_DOMAIN_NAME=${OS_PROJECT_DOMAIN_NAME:-"Default"}
export OS_TENANT_ID="<OVH OpenStack tenant ID that is also the ID of the project on the OVH project web page>"
export OS_TENANT_NAME="<OVH OpenStack tenant>"
export OS_USERNAME="<OVH OpenStack username>"
export OS_PASSWORD="<OVH OpenStack password for username>"
export OS_REGION_NAME="<OVH Openstack region that is also for the cluster (from https://www.ovhcloud.com/en/public-cloud/regions-availability/): GRA1, GRA7 ...>"
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi

#### OVH API vars from OVHcloud manager
export OVH_ENDPOINT="<the ovh endpoint>"
export OVH_BASEURL="<the ovh baseurl for the API>"
export OVH_APPLICATION_KEY="<the AK value>"
export OVH_APPLICATION_SECRET="<the AS value>"
export OVH_CONSUMER_KEY="<the CS value>"
export OVH_CLOUD_PROJECT_SERVICE="$OS_TENANT_ID"

### OVHcloud API endpoints
#   OVH_ENDPOINT 	: 	OVH_BASEURL
#   ovh-eu		:	https://eu.api.ovh.com/1.0
#   ovh-us		:	https://api.us.ovhcloud.com/1.0
#   ovh-ca		:	https://ca.api.ovh.com/1.0
#   kimsufi-eu		:	https://eu.api.kimsufi.com/1.0
#   kimsufi-ca		:	https://ca.api.kimsufi.com/1.0
#   soyoustart-eu	:	https://eu.api.soyoustart.com/1.0
#   soyoustart-ca	:	https://ca.api.soyoustart.com/1.0
#################################################

# configure access to S3 where tfstates are stored
export AWS_ACCESS_KEY_ID="<the access key id>"
export AWS_SECRET_ACCESS_KEY="<the secret access key>"
export AWS_S3_ENDPOINT="<the OVH s3 endpoint URL>"
export AWS_REGION="<the OVH s3 region>"
# variables used by infrastructure components
export CLUSTER_VERSION="<kubernetes version of the cluster: 1.23, 1.24, ...>"
export NODEPOOL_FLAVOR="<flavor set to each node : b2-7, b2-15, R2-30, ...>"
export DESIRED_NODES_NUM="<Desired number of kubernetes nodes>"
export MAX_NODES_NUM="<Maximum number of kubernetes nodes>"
export MIN_NODES_NUM="<Minimum number of kubernetes nodes>"
export DNS_ZONE="<domain name : eimis.incubateur.net, eimis.fr, ...>"
export ISSUER_MAIL="<email address used for letsEncrypt/ACME registration>"
export GLOBALE_REGION="<OVH global location for PostGreSQL and VPC>"
export DATABASE_VERSION="<Version of postgresql>"
export DATABASE_PLAN="<OVH plan for database : essential = 1 nodes, business = 2 nodes, enterprise = 3 nodes>"
export DATABASE_FLAVOR="<OVH flavor of the VM on which the database is installed : db1-4, db1-7, db1-15, db1-30, ...>"
export DATABASE_DISK_SIZE="<Size of the disk for the database VM>"
export VLAN_CIDR="<Range of IP for the private network e.g. 192.168.30>"
# variables used by matrix components
export SERVER_SUBDOMAIN_NAME="<the matrix serverName will be : SERVER_SUBDOMAIN_NAME.ENVIRONMENT.DNS_ZONE>"
export ELEMENT_SUBDOMAIN_NAME="<the front-end url will be : ELEMENT_SUBDOMAIN_NAME.ENVIRONMENT.DNS_ZONE>"
export SMTP_HOST="<configuration to send mail : host of the SMTP server>"
export SMTP_PORT="<configuration to send mail : port of the SMTP server>"
export SMTP_USER="<configuration to send mail : user to connect to the SMTP server>"
export SMTP_PASS="<configuration to send mail : password of connect to the SMTP server>"
export SMTP_NOTIFY_FROM="<mail from like : 'Display name<email@example.org>'>"
export SYNAPSE_DB_INSTANCE_NAME="<database name of the postgresql database linked to synapse>"
export SYNAPSE_DB_USER="<username to access the postgresql database linked to synapse>"
export FIRST_EIMIS_USERNAME="<username of the first eimis user created when bootstraping>"
export FIRST_EIMIS_PASSWORD="<password of the first eimis user created when bootstraping>"
export DUMMY_USERNAME="<dummy user used with the discovery room mecanism>"
export DUMMY_PASSWORD="<password for the dummy user>"
export FEDERATION_SERVERS_LIST="<list of comma separated URI of synapse servers included in federation. Ex : ['preprod.eimis.incubateur.net','matrix.pandalab.fr']>"
export SYNAPSE_AUTO_REGISTRATION="<if set to true, users can auto register. If set to false, they can only be registered by admin>"
# variables used to connect to Pro Santé Connect.
# see : https://industriels.esante.gouv.fr/produits-et-services/pro-sante-connect/documentation-technique
export PROSANTE_CONNECT_ENABLED="<true to login with PSC>"
export PROSANTE_CONNECT_ISSUER="<Used to validate tokens and to discover the Pros Santé Connect's endpoints (required but unused)>"
export PROSANTE_CONNECT_AUTHORIZATION_ENDPOINT="<Authorization endpoint used to connect to Pro Santé Connect>"
export PROSANTE_CONNECT_TOKEN_ENDPOINT="<Token endpoint used to retrieve token from Pro Santé Connect>"
export PROSANTE_CONNECT_USERINFO_ENDPOINT="<Userinfo endpoint used to retrieve info on user from Pro Santé Connect>"
export PROSANTE_CONNECT_JKWS_URI="<URI where to fetch the JWKS from Pro Santé Connect>"
export PROSANTE_CONNECT_CLIENT_ID="<Client ID used to identify the client against Pro Santé Connect>"
export PROSANTE_CONNECT_CLIENT_SECRET="<Client secret associated with client ID used to identify the client against Pro Santé Connect>"
# variables used by the MS Teams bridge
export TEAMS_BRIDGE_ENABLED="<true or false>"
export TEAMS_BRIDGE_SUBDOMAIN_NAME="<the MS Teams bridge serverName will be : TEAMS_BRIDGE_SUBDOMAIN_NAME.ENVIRONMENT.DNS_ZONE>"
export TEAMS_OAUTH_CLIENT_ID="<Application (client) ID coming from the azure portal app registration>"
export TEAMS_OAUTH_CLIENT_SECRET="<Application secret coming from the azure portal app registration>"
# monitoring
export MONITORING_SUBDOMAIN_NAME="monitoring"