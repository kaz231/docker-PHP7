#!/bin/sh
set -e

if [ -z "$(ls -A $APP_DIR)" ]; then
  echo "$APP_DIR is empty"
  exit 1
fi

# get gid and uid of host user that is an owner of volume's files
VOLUME_UID=$(stat -c "%u" "$APP_DIR")
VOLUME_GID=$(stat -c "%g" "$APP_DIR")

# create group and user using fetched gid and uid
addgroup -g "$VOLUME_GID" "$APP_USER_GROUP"
adduser -u "$VOLUME_UID" -G "$APP_USER_GROUP" -D "$APP_USER"

# run given command as $APP_USER
su-exec "$APP_USER" "$@"
