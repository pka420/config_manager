#!/bin/bash

user_email=""
site_url=""

certbot certonly \
    --non-interactive \
    --agree-tos \
    --email ${user_email} \
    --dns-cloudflare \
    --dns-cloudflare-credentials ./cloudflare.ini \
    -d ${site_url} \
    -d www.${site_url}

