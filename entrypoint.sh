#!/bin/bash
set -e

CONFIG=/etc/spyserver/spyserver.config

sed -i "s/bind_port.*/bind_port = ${BIND_PORT:=5555}/g" $CONFIG
sed -i "s/list_in_directory.*/list_in_directory = ${LIST_IN_DIRECTORY:=1}/g" $CONFIG
sed -i "s/owner_name.*/owner_name = ${OWNER_NAME:=}/g" $CONFIG
sed -i "s/owner_email.*/owner_email = ${OWNER_EMAIL:=}/g" $CONFIG
sed -i "s/antenna_type.*/antenna_type = ${ANTENNA_TYPE:=}/g" $CONFIG
sed -i "s/antenna_location.*/antenna_location = ${ANTENNA_LOCATION:=}/g" $CONFIG
sed -i "s/general_description.*/general_description = ${GENERAL_DESCRIPTION:=}/g" $CONFIG
sed -i "s/maximum_clients.*/maximum_clients = ${MAXIMUM_CLIENTS:=1}/g" $CONFIG
sed -i "s/#maximum_session_duration.*/maximum_session_duration = ${MAXIMUM_SESSION_DURATION:=0}/g" $CONFIG
sed -i "s/allow_control.*/allow_control = ${AlLOW_CONTROL:=1}/g" $CONFIG
sed -i "s/device_type.*/device_type = ${DEVICE_TYPE:=Auto}/g" $CONFIG
sed -i "s/device_serial.*/device_serial = ${DEVICE_SERIAL:=0}/g" $CONFIG
sed -i "s/fft_fps.*/fft_fps = ${FFT_FPS:=15}/g" $CONFIG
sed -i "s/fft_bin_bits.*/fft_bin_bits = ${FFT_BIN_BITS:=16}/g" $CONFIG
sed -i "s/initial_frequency.*/initial_frequency = ${INITIAL_FREQUENCY:=7100000}/g" $CONFIG
sed -i "s/buffer_size_ms.*/buffer_size_ms = ${BUFFER_SIZE_MS:=50}/g" $CONFIG
sed -i "s/buffer_count.*/buffer_count = ${BUFFER_COUNT:=10}/g" $CONFIG

exec spyserver $CONFIG
