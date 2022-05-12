FROM node:lts-stretch-slim AS builder

ARG VERSION=4.18.0

RUN set -xe \
  && mkdir -p /staging \
  && npm install --prefix /staging @contrast/agent@${VERSION}

FROM busybox:stable AS final

COPY ./src/shared/entrypoint.sh /entrypoint.sh
COPY --from=builder /staging/node_modules /staging

ENV CONTRAST_MOUNT_PATH=/contrast

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
