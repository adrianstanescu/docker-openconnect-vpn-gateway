#!/bin/sh

openconnect --user ${USERNAME} \
            --csd-wrapper=/usr/libexec/openconnect/csd-post.sh \
            --form-entry main:password=${PASSWORD} \
            ${SERVER}
