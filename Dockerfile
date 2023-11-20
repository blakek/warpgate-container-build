FROM docker.io/library/debian:bookworm

ENV DEBIAN_FRONTEND noninteractive
RUN <<EOF
  echo "Downloading warpgate…"
  warpgate_version="v0.8.1"
  arch="arm64"

  download_url="https://github.com/warp-tech/warpgate/releases/download/{$warpgate_version}/warpgate-{$warpgate_version}-{$arch}-linux"
  
  curl --silent --show-error --location --fail --output /usr/local/bin/warpgate "$download_url"
  chmod +x /usr/local/bin/warpgate
EOF

VOLUME /data

ENV DOCKER 1

ENTRYPOINT ["warpgate", "--config", "/data/warpgate.yaml"]
CMD ["run"]

