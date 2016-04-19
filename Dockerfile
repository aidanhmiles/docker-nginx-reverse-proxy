FROM nginx:stable-alpine

RUN apk add --update bash \
&& rm /etc/nginx/nginx.conf \
&& rm /etc/nginx/nginx.conf.default

USER www-data

WORKDIR /usr/local/share/

RUN chown -R www-data.www-data /usr/local/share/

COPY . .

ENTRYPOINT ["/bin/sh", "-c"]
EXPOSE 80 443

CMD ["/usr/local/share/docker-cmd"]

