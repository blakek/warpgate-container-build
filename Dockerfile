FROM docker.io/library/debian:bookworm

ENV DEBIAN_FRONTEND noninteractive

ADD https://github.com/warp-tech/warpgate/releases/download/v0.8.1/warpgate-v0.8.1-arm64-linux /usr/local/bin/warpgate
RUN chmod +x /usr/local/bin/warpgate

VOLUME /data

ENV DOCKER 1

ENTRYPOINT ["warpgate", "--config", "/data/warpgate.yaml"]
CMD ["run"]
