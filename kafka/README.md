# Kafka docker image

Simple Kafka image that starts with KRaft protocol, the image is based on the [amazoncorreto:17-al2](https://github.com/corretto/corretto-docker/blob/7996710c56ef95dba20bb0d5784b0e941dfdaa5b/17/jdk/al2/Dockerfile) image.

The server runs with a defined `kafka` user.

# Pre-requisites

To build an image you need to install [docker](https://docs.docker.com/desktop/).


# Build process 
 
To build the image it is needed to run the `docker build` command, for example:

```shell
docker build . -t arm64v8/kafka:<version> 
```