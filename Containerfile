FROM docker.io/debian:13.6@sha256:34cd9e9fd437c0a095ec39cb2e73422c9f30821b0d0848ed74fd0d43bae4d958 AS pkg-installer

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
LABEL org.opencontainers.image.url=""
LABEL org.opencontainers.image.vendor=""
LABEL org.opencontainers.image.version=""
