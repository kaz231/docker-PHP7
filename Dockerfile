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
    && ln -s /usr/bin/php7 /usr/bin/php \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

WORKDIR $APP_DIR
USER $APP_USER

ENTRYPOINT [ "/usr/bin/php" ]

CMD ["--version"]
