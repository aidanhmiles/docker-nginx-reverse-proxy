FROM nginx:stable-alpine

RUN apk add --update bash \
&& rm /etc/nginx/nginx.conf \
&& rm /etc/nginx/nginx.conf.default

# RUN addgroup -S www-data
# RUN addgroup nginx www-data

# VOLUME /usr/share/nginx/html/

# RUN chown -R nginx:www-data /usr/share/nginx/html
# RUN chown -R nginx /usr/share/nginx/html/
# RUN chown -R nginx /usr/local/share/

WORKDIR /usr/local/share/

COPY . .


RUN source ./env-default.sh \
&& ./envsub < ./nginx.conf.template > /etc/nginx/nginx.conf \
&& cat /etc/nginx/nginx.conf

RUN ls /usr/share/nginx/html/

# USER nginx

# ENTRYPOINT ["/bin/bash", "-c"]
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

