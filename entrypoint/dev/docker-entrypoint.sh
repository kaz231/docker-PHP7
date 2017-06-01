#!/bin/sh
set -e

if [ -z "$(ls -A $APP_DIR)" ]; then
  echo "$APP_DIR is empty"
  exit 1
fi

# get uid of host user that is an owner of volume's files
VOLUME_UID=$(stat -c "%u" "$APP_DIR")

# change user's uid to owner of volume
usermod -u "$VOLUME_UID" "$APP_USER"

# run given command as $APP_USER
su-exec "$APP_USER" "$@"
