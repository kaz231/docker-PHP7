#!/bin/sh
set -e

# run given command as $APP_USER
su-exec "$APP_USER" "$@"
