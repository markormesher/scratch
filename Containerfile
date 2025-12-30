FROM docker.io/debian:13.2@sha256:c71b05eac0b20adb4cdcc9f7b052227efd7da381ad10bb92f972e8eae7c6cdc9 AS pkg-installer

RUN apt update && apt install -y --no-install-recommends ca-certificates tzdata

# ---

FROM scratch

LABEL image.registry=ghcr.io
LABEL image.name=markormesher/scratch

COPY --from=pkg-installer /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=pkg-installer /usr/share/zoneinfo /usr/share/zoneinfo
COPY ./passwd ./groups /etc/
