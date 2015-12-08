#!/bin/sh

/scripts/generate-config
/scripts/db/wait

cat > /etc/apache2/conf.d/servername.conf <<EOF
ServerName ${RT_DOMAIN:-localhost}
EOF

if ! /scripts/db/check; then
	rt-setup-database --action init --skip-create
fi

exec "$@"

