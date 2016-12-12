#!/bin/bash

# defaults
# :- operator sets a variable to a default, if currently unset or null
# in practice, if the var is not set by docker(or compose), this file provides a default
# More info:
# http://www.tldp.org/LDP/abs/html/parameter-substitution.html
export NGINX_PORT=${NGINX_PORT:-80}
export WEB_PORT=${WEB_PORT:-8080}
export WEB_HOSTNAME=${WEB_HOSTNAME:-web}

# if the var PROXY_TYPE is set, choose the appropriate nginx configuration
case "$PROXY_TYPE" in 
  # pass all requests through to the backend
  all) export NGINX_CONFIG_TEMPLATE="nginx-total-proxy.conf.template"
       ;;
  # if 'api', only pass requests for the PROXY_PATH to the backend
  # and use STATIC_FILES_PATH for static assets (e.g. index.html)
  api) export NGINX_CONFIG_TEMPLATE="nginx.default.conf.template"
       ;;
  # not set, use default
  *) export NGINX_CONFIG_TEMPLATE="nginx.default.conf.template"
       ;;
esac

# can leave these set regardless of PROXY_TYPE
export STATIC_FILES_PATH=${STATIC_FILES_PATH:-"/usr/local/share/www"}
export PROXY_PATH=${PROXY_PATH:-"/api"}
