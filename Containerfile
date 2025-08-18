FROM docker.io/debian:13.0 AS ca-cert-installer

RUN apt update && apt install -y --no-install-recommends ca-certificates

# ---

FROM scratch

LABEL image.registry=ghcr.io
LABEL image.name=markormesher/scratch

COPY --from=ca-cert-installer /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY ./passwd ./groups /etc/
