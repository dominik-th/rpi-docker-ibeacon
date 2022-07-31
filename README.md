## rpi-docker-ibeacon

[![Docker Image Size](https://img.shields.io/docker/image-size/dominikth/rpi-docker-ibeacon)](https://hub.docker.com/r/dominikth/rpi-docker-ibeacon)
[![Docker Pulls](https://img.shields.io/docker/pulls/dominikth/rpi-docker-ibeacon)](https://hub.docker.com/r/dominikth/rpi-docker-ibeacon)

This is a docker image to use your existing Raspberry Pi 3 as an iBeacon without any additional hardware.

### Installation

Run the image as a regular docker container. The UUID, major and minor values can be provided as environment variables. Learn more about what they mean [here](https://developer.apple.com/ibeacon/Getting-Started-with-iBeacon.pdf).

```bash
$ docker run \
  --name ibeacon \
  --net=host \
  -dit \
  -e UUID=a84ad600-d217-40e2-b51c-ccbc5e8cc2af \
  -e MAJOR=0 \
  -e MINOR=0 \
  dominikth/rpi-docker-ibeacon
```

Alternatively use [docker-compose](https://docs.docker.com/compose/):
```yaml
version: '3.7'

services:
  ibeacon:
    image: dominikth/rpi-docker-ibeacon
    network_mode: host
    environment:
      - UUID=a84ad600-d217-40e2-b51c-ccbc5e8cc2af
      - MAJOR=0
      - MINOR=0
```

### Limitations

Unfortunately currently it is not possible to create multiple iBeacons at the same time.
