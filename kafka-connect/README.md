# Kafka docker image

Simple Kafka image that starts with KRaft protocol, the image is based on the [amazoncorreto:17-al2](https://github.com/corretto/corretto-docker/blob/7996710c56ef95dba20bb0d5784b0e941dfdaa5b/17/jdk/al2/Dockerfile) image.

The server runs with a defined `kafka` user.

# Pre-requisites

To build an image you need to install [docker](https://docs.docker.com/desktop/).

# Build process

To build the image it is needed to run the `docker build` command, for example:

```shell
docker build . -t <docker_hub_username>/kafka-broker:<version> 
```

The server runs with a defined `kafka` user.

# Running the docker container

This is an example of how to use the image in a `docker-compose` file.

Configurable environment variables:

- `KAFKA_BOOTSTRAP_SERVERS` - The kafka brokers to connect (default: `localhost:9092`)
- `KAFKA_CONNECT_GROUP_ID` -  The group id for this connector (default: `connect-cluster`)
- `KAFKA_CONNECT_STORAGE_TOPIC` - The kafak connect storage topic (default: `connect-offsets`)
- `KAFKA_CONTROLLER_PORT` - Listener Port for the broker


Reference [Apache Kafka](https://kafka.apache.org/documentation.html#brokerconfigs)

```
version: '3.7'

services
  kafka_connect_1:
    container_name: kafka_connect_1
    image: josebarrueta/kafka-connect:3.3.2
    hostname: kafka_1
    restart: always
    environment:
      KAFKA_BOOTSTRAP_SERVERS: kafka_1:9092
      KAFKA_CONNECT_LISTENERS: http://localhost:8083
    ports:
      - "8083:8083"
    volumes:
      - ./kafka-connect/1/volume_data:/var/log/kafka
    networks:
     - kafka_network
networks:
  kafka_network:
    
```