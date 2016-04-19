#!/bin/bash

# defaults
# :- operator sets a variable to a default, if currently unset or null
# More info:
# http://www.tldp.org/LDP/abs/html/parameter-substitution.html
export NGINX_PORT=${NGINX_PORT:-80}
export WEB_PORT=${WEB_PORT:-8080}
export WEB_HOSTNAME=${WEB_HOSTNAME:-web}
export PROXY_PATH=${PROXY_PATH:-"/api"}
