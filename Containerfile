FROM docker.io/debian:13.3@sha256:2c91e484d93f0830a7e05a2b9d92a7b102be7cab562198b984a84fdbc7806d91 AS pkg-installer

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