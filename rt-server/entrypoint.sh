#!/bin/sh

. /scripts/functions.sh

MY_ADDRESS=$(ip addr show eth0 |
	awk '$1 == "inet" {print $2}' |
	cut -f1 -d/)

: ${RT_DOMAIN:=localhost}
: ${RT_WEBDOMAIN:=$MY_ADDRESS}

export RT_DOMAIN RT_WEBDOMAIN

/scripts/generate-msmtprc
/scripts/generate-rt-config
/scripts/db/wait
/scripts/db/check || /scripts/initialize-db

cat > /etc/apache2/conf.d/servername.conf <<EOF
ServerName ${RT_WEBDOMAIN}
EOF

info 'setting password for rt root user'
/scripts/rt-passwd root "$RT_ROOT_PASSWORD"

info 'configuring apache log directory'
mkdir -p /var/log/apache2
chown -R apache:apache /var/log/apache2

exec "$@"

