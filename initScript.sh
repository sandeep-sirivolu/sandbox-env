#!/bin/bash
export user=$(env | grep OWNER_EMAIL | sed 's/@.*//' | sed 's/^.*=//')

value="${user#mfwsuser}"
if [[ "$value" -lt 10 ]]; then
    value="0$value"
fi
demouser="cust0$value"

zowe config set "profiles.base.properties.user" $demouser --secure false --global-config
zowe config set "profiles.base.properties.password" $demouser --secure false --global-config

code --install-extension broadcommfd.code4z-extension-pack