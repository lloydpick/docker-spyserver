FROM debian:bullseye-slim

RUN apt update && apt install -y \
    rtl-sdr \
    librtlsdr-dev \
    wget && \
    ARCH= && dpkgArch="$(dpkg --print-architecture)" && \
    case "${dpkgArch##*-}" in \
      amd64) ARCH='linux-x64';; \
      arm64) ARCH='arm64';; \
      *)     echo "Unsupported architecture: ${dpkgArch}"; exit 1;; \
    esac && \
    wget --no-verbose https://airspy.com/downloads/spyserver-${ARCH}.tgz && \
    tar xvzf spyserver-${ARCH}.tgz && \
    rm spyserver-${ARCH}.tgz && \
    mv spyserver spyserver_ping /usr/bin && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver && \
    apt remove -y wget && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
