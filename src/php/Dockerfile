FROM ubuntu:bionic AS builder

RUN set -xe \
  && apt-get update \
  && apt-get install -y curl gnupg2 rsync

ARG VERSION=1.2.0

RUN set -xe \
  && curl https://pkg.contrastsecurity.com/api/gpg/key/public | apt-key add - \
  && echo "deb https://pkg.contrastsecurity.com/debian-public/ bionic contrast" > /etc/apt/sources.list.d/contrast.list \
  && echo "deb https://pkg.contrastsecurity.com/debian-public/ all contrast" >> /etc/apt/sources.list.d/contrast.list \
  && apt-get update \
  && apt-get install -y contrast-php-agent=${VERSION} \
  && mkdir -p /staging \
  && mkdir -p /staging/ini \
  && rsync -aP /usr/local/lib/contrast/php/ /staging/ \
  && echo 'extension=${CONTRAST_MOUNT_PATH}/contrast.so' > /staging/ini/php.ini \
  && echo '{ "version": "${VERSION}" }' > /staging/image-manifest.json

FROM busybox:stable AS final

COPY ./src/shared/entrypoint.sh /entrypoint.sh
COPY --from=builder /staging /staging

ARG VERSION=1.2.0
ENV CONTRAST_MOUNT_PATH=/contrast \
  CONTRAST_VERSION=${VERSION}

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
