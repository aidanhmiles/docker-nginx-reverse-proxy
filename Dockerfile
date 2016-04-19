FROM nginx:stable-alpine

RUN apk add --update bash \
&& rm /etc/nginx/nginx.conf \
&& rm /etc/nginx/nginx.conf.default

RUN addgroup -S www-data
RUN addgroup nginx www-data

RUN chown -R nginx:www-data /usr/share/nginx/html

WORKDIR /usr/local/share/

USER nginx

COPY . .

ENTRYPOINT ["/bin/bash", "-c"]
EXPOSE 80 443

CMD ["/usr/local/share/docker-cmd"]

