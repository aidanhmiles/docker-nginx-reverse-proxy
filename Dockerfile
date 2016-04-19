FROM nginx:stable-alpine

RUN apk add --update bash \
&& rm /etc/nginx/nginx.conf \
&& rm /etc/nginx/nginx.conf.default

WORKDIR /usr/local/share/

COPY . .

RUN source ./env-default.sh \
&& ./envsub < ./nginx.conf.template > /etc/nginx/nginx.conf \
&& cat /etc/nginx/nginx.conf


ENTRYPOINT ["/bin/bash", "-c"]
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

