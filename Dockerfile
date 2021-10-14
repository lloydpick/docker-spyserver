FROM ubuntu:bionic

ARG TARGETPLATFORM
ENV TARGETPLATFORM "$TARGETPLATFORM"

RUN apt-get update
RUN apt-get install -y --no-install-recommends rtl-sdr librtlsdr-dev wget unzip build-essential cmake libusb-1.0-0-dev pkg-config

RUN set -ex; \
  if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
    wget https://airspy.com/downloads/spyserver-linux-x64.tgz --no-check-certificate;\
    tar xvzf spyserver-linux-x64.tgz;\
    rm spyserver-linux-x64.tgz;\
  elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
    wget https://airspy.com/downloads/spyserver-arm32.tgz --no-check-certificate;\
    tar xvzf spyserver-arm32.tgz;\
    rm spyserver-arm32.tgz;\
  fi;

RUN mv spyserver spyserver_ping /usr/bin && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver

RUN wget https://github.com/airspy/airspyhf/archive/master.zip --no-check-certificate &&\
    unzip master.zip &&\
    cd airspyhf-master &&\
    mkdir build &&\
    cd build &&\
    cmake ../ -DINSTALL_UDEV_RULES=ON &&\
    make &&\
    make install &&\
    ldconfig &&\
    cd / &&\
    rm master.zip &&\
    rm -R airspyhf-master

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
