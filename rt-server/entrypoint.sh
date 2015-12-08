#!/bin/sh

/scripts/generate-msmtprc
/scripts/generate-rt-config
/scripts/db/wait

cat > /etc/apache2/conf.d/servername.conf <<EOF
ServerName ${RT_DOMAIN:-localhost}
EOF

if ! /scripts/db/check; then
	rt-setup-database --action init --skip-create
	if [ -f /etc/rt4/sitedata ]; then
		rt-setup-database --action insert \
			--datafile /etc/rt4/sitedata
	fi
fi

/scripts/rt-passwd root "$RT_ROOT_PASSWORD"

exec "$@"

