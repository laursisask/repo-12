FROM ubuntu:bionic AS builder

RUN set -xe \
  && apt-get update \
  && apt-get install -y curl

ARG VERSION=3.13.0.26525

RUN set -xe \
  && mkdir -p /staging \
  && curl --location \
  https://search.maven.org/remotecontent?filepath=com/contrastsecurity/contrast-agent/${VERSION}/contrast-agent-${VERSION}.jar \
  --output /staging/contrast.jar \
  && echo '{ "version": "${VERSION}" }' > /staging/image-manifest.json

FROM busybox:stable AS final

COPY ./src/shared/entrypoint.sh /entrypoint.sh
COPY --from=builder /staging /staging

ARG VERSION=3.13.0.26525
ENV CONTRAST_MOUNT_PATH=/contrast \
  CONTRAST_VERSION=${VERSION}

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
