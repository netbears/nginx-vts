#!/bin/sh

set -e

port=$(echo "${PORT:=8080}" | sed 's:/:\\/:g')
healthcheck=$(echo "${HEALTHCHECK_PATH:=/ping}" | sed 's:/:\\/:g')
metrics=$(echo "${METRICS_PATH:=/metrics}" | sed 's:/:\\/:g')
podcidr=$(echo "${POD_CIDR:=0.0.0.0/0}" | sed 's:/:\\/:g')


sed -i "s/env_port/$port/" /etc/nginx/nginx.conf
sed -i "s/env_healthcheck_location/$healthcheck/" /etc/nginx/nginx.conf
sed -i "s/env_metrics_location/$metrics/" /etc/nginx/nginx.conf
sed -i "s/env_pod_cidr/$podcidr/" /etc/nginx/nginx.conf

$@
