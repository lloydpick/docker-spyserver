FROM ubuntu:jammy

ARG TARGETPLATFORM
ENV TARGETPLATFORM "$TARGETPLATFORM"

RUN apt-get update && apt-get install -y rtl-sdr librtlsdr-dev wget libairspy0 libairspyhf1 libairspy-dev libairspyhf-dev

RUN set -ex; \
  if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
    wget https://airspy.com/downloads/spyserver-linux-x64.tgz;\
    tar xvzf spyserver-linux-x64.tgz;\
    rm spyserver-linux-x64.tgz;\
  elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
    wget https://airspy.com/downloads/spyserver-arm64.tgz;\
    tar xvzf spyserver-arm64.tgz;\
    rm spyserver-arm64.tgz;\
  elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
    wget --no-check-certificate https://airspy.com/downloads/spyserver-arm32.tgz;\
    tar xvzf spyserver-arm32.tgz;\
    rm spyserver-arm32.tgz;\
  fi;

RUN mv spyserver spyserver_ping /usr/bin && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
