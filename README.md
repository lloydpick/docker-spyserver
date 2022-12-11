# Docker AirSpy SpyServer

Docker container for [AirSpy SpyServer](https://airspy.com/download), with support for x86, arm64 and arm32.

[![](https://images.microbadger.com/badges/version/lloydpick/spyserver.svg)](https://microbadger.com/images/lloydpick/spyserver "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/lloydpick/spyserver.svg)](https://microbadger.com/images/lloydpick/spyserver "Get your own image badge on microbadger.com") https://hub.docker.com/r/lloydpick/spyserver

## Summary

The container provides you with the SpyServer application running on port 5555. It has been tested with RTL-SDR R820T2 RTL2832U, AirspyOne and AirspyHF+ SDR devices on a Raspberry Pi 3 Model B+, Pi 4 and amd64 computing platforms. There is a [docker-compose.yml](https://github.com/lloydpick/docker-spyserver/blob/master/docker-compose.yml) file should you want to see how to correctly mount the USB device.

### Example

See [docker-compose.yml](https://github.com/lloydpick/docker-spyserver/blob/master/docker-compose.yml)

### Configuration

All configuration for this Docker container is done via environmental variables with sane defaults. To change a setting, simply set the appropriate environment variable.

| Environment Variable     | Default Value | Notes |
|:------------------------:|:-------------:|:------|
|`BIND_PORT`               |`5555`         |Port to run SpyServer on|
|`LIST_IN_DIRECTORY`       |`1`            |List Server in the [AirSpy Directory](https://airspy.com/directory/), `1` for yes, `0` for no|
|`OWNER_NAME`              |               |Name in the directory|
|`OWNER_EMAIL`             |               |Directory contact|
|`ANTENNA_TYPE`            |               |Random Wire/Magnetic Loop/Mini-Whip/Inverted V/etc.|
|`ANTENNA_LOCATION`        |               |Lat/Long, eg. `48.858332, 2.294560`|
|`GENERAL_DESCRIPTION`     |               |Description for the directory|
|`MAXIMUM_CLIENTS`         |`1`            |Maximum number of clients that can connect at a time|
|`MAXIMUM_SESSION_DURATION`|`0`            |Maximum session duration in minutes. `0` for no limit|
|`ALLOW_CONTROL`           |`1`            |Allow clients to retune and change of gain of the device|
|`DEVICE_TYPE`             |`Auto`         |Possible Values: `AirspyOne`, `AirspyHF+`, `RTL-SDR`, `Auto` (Scans for the first available device)|
|`DEVICE_SERIAL`           |`0`            |Device Serial Number as 64bit hex eg. `0xDD52D95C904534AD`. A value of `0` will acquire the first available device.|
|`FFT_FPS`                 |`15`           |FFT Frames Per Second|
|`FFT_BIN_BITS`            |`16`           |FFT Bins, Bins = 2^fft_bin_bits|
|`INITIAL_FREQUENCY`       |`7100000`      |Initial Center Frequency|
|`BUFFER_SIZE_MS`          |`50`           |Buffer Size (in milliseconds)|
|`BUFFER_COUNT`            |`10`           |Buffer Count|
|`DEVICE_SAMPLE_RATE`      |`2500000`      |Device Sample Rate|
|`INITIAL_FREQUENCY`       |`7100000`      |Initial Center Frequency (in Hz)|
|`INITIAL_GAIN`            |`5`            |Initial Gain|
|`ENABLE_BIAS_TEE`         |`0`            |Bias-Tee - For AirspyOne only - Useful for LNA's and SpyVerter|
|`FORCE_8BIT`              |`1`            |Force 8bit Compression Mode - Use it to same some internet bandwidth.|
|`MAXIMUM_BANDWIDTH`       |`15000`        |Maximum Bandwidth - Recommended value for narrow band modes is 15000|
|`MAXIMUM_FREQUENCY`       |`35000000`     |Maximum Tunable Frequency (in Hz)|
|`MINIMUM_FREQUENCY`       |`0`            |Minimum Tunable Frequency (in Hz)|

### Rebuilding

If you wish to rebuild this image for yourself, you can use the [Dockerfile](https://github.com/lloydpick/docker-spyserver/blob/master/Dockerfile) provided. However, the image that exists on DockerHub was built using the Docker experimental `buildx` functionality to build the `arm32` version from a Mac. You can view the build command in the [Makefile](https://github.com/lloydpick/docker-spyserver/blob/master/Makefile).
