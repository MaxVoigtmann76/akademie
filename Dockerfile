FROM mindhochschulnetzwerk/php-base

LABEL Maintainer="Henrik Gebauer <code@henrik-gebauer.de>" \
      Description="mind-hochschul-netzwerk.de"

COPY app/ /var/www/

RUN set -ex \
  && apk --no-cache add \
    php7-session \
    php7-curl \
  && mkdir /var/www/vendor && chown www-data:www-data /var/www/vendor \
  && su www-data -s /bin/sh -c "composer install -d /var/www --optimize-autoloader --no-dev --no-interaction --no-progress --no-cache" \
  && chown -R nobody:nobody /var/www
