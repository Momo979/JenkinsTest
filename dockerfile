FROM ubuntu:18.04
RUN apt-get update -y && \
 apt-get install apache2 curl -y --no-install-recommends
WORKDIR /var/www/html/
COPY index.html .
HEALTHCHECK CMD curl -f http://localhost/ || exit 1
EXPOSE 80
ENTRYPOINT [ "apache2ctl", "-D", "FOREGROUND" ]
