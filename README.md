# docker 

This is a repository to declare docker images files for useful infrastructure

To build this is

## Prerequisites (for mac)

- Install [docker](https://docs.docker.com/desktop/install/mac-install/) 
- Create the buildx (multi-platform) builder
 
```shell
docker buildx create --name multi-arch-builder --use --bootstrap
```

The output should be similar to the following:

```
 [+] Building 1.6s (1/1) FINISHED
 => [internal] booting buildkit                                                                                                                                                                                                        1.6s
 => => pulling image moby/buildkit:buildx-stable-1                                                                                                                                                                                     1.1s
 => => creating container buildx_buildkit_multi-arch-builder0                                                                                                                                                                          0.4s
multi-arch-builder
```

## Content

- docker/kafka-base     - This is a kafka base image, not meant to be run but to be the parent for other kafka images. 
- docker/kafka-broker   - Kafka - 3.3.2 version with KRaft (no zookeeper).
- docker/kafka-connect  - 

## Build an image


```shell
docker buildx build --push \
--platform linux/amd64,linux/arm64 \
--tag <reposo>/kafka-base:buildx-latest .
```