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
docker run -v $(pwd):/var/app kaz231/alpine-php7 php my_php_app.php
```

### How to run tests ?

All tests are created using ansible. First created image is run and then output is verfied using assertions. You can simple run tests with command:

```
ansible-playbook tests/<image>/tests.yml -i tests/localhost -c local
```

where __image__ is e.g. alpine-php7.

### Change-log

* __0.7.1__:
  - php7-tokenizer and php7-xmlwriter packages were added to list of installed for dev and prod
* __0.7.0__:
  - shadow package was added for dev image
  - app's user is created in Dockerfile instead of entrypoint
  - usdermod was used to imitate owner of volume
* __0.6.0__:
  - custom entrypoint was added for prod image
  - su-exec is installed for prod image
* __0.5.0__:
  - php7-dom package was added to the list of dependencies for dev and prod images
* __0.4.0__:
  - php7-xml package was added to the list of dependencies for dev and prod images
* __0.3.0__:
  - tests were reorganized into dedicated directory per image
  - for dev image, user is created based on the gid and uid of the host's user
* __0.2.0__:
  - dev version of alpine-php7 image was released (including composer)
* __0.1.0__:
  - alpine-php7 image was added
