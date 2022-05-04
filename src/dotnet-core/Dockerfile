FROM ubuntu:bionic AS builder

RUN set -xe \
  && apt-get update \
  && apt-get install -y curl unzip rsync

ARG VERSION=2.1.10

RUN set -xe \
  && curl --location https://www.nuget.org/api/v2/package/Contrast.SensorsNetCore/${VERSION} --output /tmp/contrast.zip \
  && unzip /tmp/contrast.zip -d /tmp/contrast \
  && rsync -aP /tmp/contrast/contentFiles/any/netstandard2.0/contrast/* /staging/

FROM busybox:stable AS final

COPY ./src/shared/entrypoint.sh /entrypoint.sh
COPY --from=builder /staging /staging

ENV CONTRAST_MOUNT_PATH=/contrast

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]
