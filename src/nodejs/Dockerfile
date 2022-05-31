FROM node:lts-stretch-slim AS builder

ARG VERSION=4.18.0

RUN set -xe \
  && mkdir -p /staging \
  && npm install --prefix /staging @contrast/agent@${VERSION} \
  && echo '{ "version": "${VERSION}" }' > /staging/image-manifest.json

FROM busybox:stable AS final

COPY ./src/shared/entrypoint.sh /entrypoint.sh
COPY --from=builder /staging /staging

ARG VERSION=4.18.0
ENV CONTRAST_MOUNT_PATH=/contrast \
  CONTRAST_VERSION=${VERSION}

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
