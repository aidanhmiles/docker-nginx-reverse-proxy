FROM nginx:stable-alpine

RUN apk add --update bash \
&& rm /etc/nginx/nginx.conf \
&& rm /etc/nginx/nginx.conf.default

COPY . /usr/local/share/

ENTRYPOINT ["/bin/sh", "-c"]
EXPOSE 80 443

CMD ["./docker-cmd"]

