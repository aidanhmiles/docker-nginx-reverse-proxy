FROM nginx:stable-alpine

RUN apk add --update bash \
&& rm /etc/nginx/nginx.conf \
&& rm /etc/nginx/nginx.conf.default

RUN adduser -S www-data

WORKDIR /usr/local/share/

RUN chown -R www-data /usr/share/nginx/html

COPY . .

ENTRYPOINT ["/bin/bash", "-c"]
EXPOSE 80 443

CMD ["/usr/local/share/docker-cmd"]

