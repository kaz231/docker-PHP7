FROM alpine:latest

LABEL maintainer "Kamil Zajac <kaz231@outlook.com>"

ENV APP_DIR "/var/app"
ENV APP_USER "app"
ENV APP_USER_GROUP "app"

RUN addgroup -S $APP_USER_GROUP \
    && adduser -G $APP_USER_GROUP -S $APP_USER \
    && mkdir -p $APP_DIR \
    && chown -R $APP_USER:$APP_USER_GROUP $APP_DIR

RUN apk update \
    && apk add \
      php7 \
      php7-opcache \
      php7-mbstring \
      php7-curl \
      php7-json \
      php7-intl \
      php7-mcrypt \
      php7-ctype \
      php7-sockets \
      php7-openssl \
      php7-session \
      php7-phar \
      php7-xml \
      php7-dom \
      ca-certificates \
      openssl \
      su-exec \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

COPY entrypoint/prod/docker-entrypoint.sh /usr/local/bin/

WORKDIR $APP_DIR

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD ["php", "--version"]
