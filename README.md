[![Build Status](https://travis-ci.org/kaz231/docker-PHP7.svg?branch=master)](https://travis-ci.org/kaz231/docker-PHP7)

PHP7 Docker Images
==================

Small docker images based on alpine:latest OS with PHP7 installed.

### Contained images

* kaz231/alpine-php7
* kaz231/alpine-php7-dev

### How to use it ?

Image contains directory for your application that is stored in $APP_DIR env var that is set as workdir. Directory is owned by dedicated user ($APP_USER:$APP_USER_GROUP) that is also a default user for image.

You can use it in following way:

```
docker run -v $(pwd):/var/app kaz231/alpine-php7 my_php_app.php
```

### How to run tests ?

All tests are created using ansible. First created image is run and then output is verfied using assertions. You can simple run tests with command:

```
ansible-playbook tests/<image>.yml -i tests/<image>
```

where __image__ is e.g. alpine-php7.

### Change-log

* __0.2.0__:
  - dev version of alpine-php7 image was released (including composer)
* __0.1.0__:
  - alpine-php7 image was added
