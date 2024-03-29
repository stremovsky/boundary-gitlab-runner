#!/bin/bash

if [ ! -f /root/.gnupg/pubring.kbx ]; then
  gpg2 --batch --passphrase '' --quick-gen-key mykey default default
  pass init mykey
fi

AUTH_METHOD_ID=$(boundary auth-methods list -format json -keyring-type none | jq -rc '.items[] | select(.type == "password" and .scope_id =="global")' | jq -rc '.id')

boundary authenticate password -auth-method-id $AUTH_METHOD_ID -login-name $BOUNDARY_USER --password=env://BOUNDARY_PASSWORD
GLOBAL_SCOPE=`boundary scopes list -format=json | jq -r '.items[] | .id'`
echo "dumping targets"
boundary targets list -scope-id=$GLOBAL_SCOPE -recursive -format=json | jq -rc '.items[]| "boundary connect ssh -target-id "+.id+" #"+.name'
