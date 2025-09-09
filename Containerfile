FROM docker.io/debian:13.1@sha256:833c135acfe9521d7a0035a296076f98c182c542a2b6b5a0fd7063d355d696be AS pkg-installer

RUN apt update && apt install -y --no-install-recommends ca-certificates tzdata

# ---

FROM scratch

LABEL image.registry=ghcr.io
LABEL image.name=markormesher/scratch

COPY --from=pkg-installer /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=pkg-installer /usr/share/zoneinfo /usr/share/zoneinfo
COPY ./passwd ./groups /etc/
