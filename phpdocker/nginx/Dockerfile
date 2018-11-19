FROM nginx:alpine
LABEL github.user="ServerContainers"

ENV ACME_CONFIG=/root/.config/acme

RUN apk update \
 && apk add wget 

EXPOSE 80 

COPY conf.d /etc/nginx/conf.d/
COPY snippets /etc/nginx/snippets/
COPY scripts /usr/local/bin/

HEALTHCHECK CMD ["docker-healthcheck.sh"]

