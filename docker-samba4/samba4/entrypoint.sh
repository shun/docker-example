#!/bin/bash
set -eu

if [ ! -e /samba4_setup_done ]; then
    samba-tool domain provision --use-rfc2307 --realm=$REALM_NAME --domain=$DOMAIN_NAME --dns-backend=$DNS_BACKEND --server-role=$SERVER_ROLE --adminpass=$ADMIN_PASS
    cp /var/lib/samba/private/krb5.conf /etc/
    touch /samba4_setup_done
fi

exec $@

