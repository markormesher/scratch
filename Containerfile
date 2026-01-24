FROM docker.io/debian:13.3@sha256:5cf544fad978371b3df255b61e209b373583cb88b733475c86e49faa15ac2104 AS pkg-installer

RUN apt update && apt install -y --no-install-recommends ca-certificates tzdata

# ---

FROM scratch

COPY --from=pkg-installer /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=pkg-installer /usr/share/zoneinfo /usr/share/zoneinfo
COPY ./passwd ./groups /etc/

LABEL image.name=markormesher/scratch
LABEL image.registry=ghcr.io
LABEL org.opencontainers.image.description=""
LABEL org.opencontainers.image.documentation=""
LABEL org.opencontainers.image.title="scratch"
LABEL org.opencontainers.image.url="https://github.com/markormesher/scratch"
LABEL org.opencontainers.image.vendor=""
LABEL org.opencontainers.image.version=""