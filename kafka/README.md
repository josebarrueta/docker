# Kafka docker image

Simple Kafka image that starts with KRaft protocol, the image is based on the [amazoncorreto:17-al2](https://github.com/corretto/corretto-docker/blob/7996710c56ef95dba20bb0d5784b0e941dfdaa5b/17/jdk/al2/Dockerfile) image.

The server runs with a defined `kafka` user.

# Pre-requisites

To build an image you need to install [docker](https://docs.docker.com/desktop/).


# Build process 
 
To build the image it is needed to run the `docker build` command, for example:

```shell
docker build . -t josebarrueta/kafka:<version> 
```


The server runs with a defined `kafka` user. 


# Running the docker container

This is an example of how to use the image in a `docker-compose` file.

Configurable environment variables:

- `KAFKA_SERVER_NODE_ID` - The node ID associated with the roles this process is playing when `process.roles` is non-empty. Every node in a KRaft cluster must have a unique `node.id`, 
this includes broker and controller nodes. This is required configuration when running in KRaft mode
- `KAFKA_SERVER_PROCESS_ROLES` - The roles that this process plays: 'broker', 'controller', or 'broker,controller' if it is both
- `KAFKA_BROKER_PORT` - Listener Port for the broker
- `KAFKA_CONTROLLER_PORT` - Listener Port for the broker


Reference [Apache Kafka](https://kafka.apache.org/documentation.html#brokerconfigs)

```
version: '3.7'

services
  kafka_1:
    container_name: kafka_1
    image: josebarrueta/kafka:3.3.2
    hostname: kafka_1
    restart: always
    environment:
      KAFKA_CLUSTER_ID: hXXhoCVLSzm8HZ_1KUlX3Q
      KAFKA_SERVER_NODE_ID: 1
      KAFKA_SERVER_PROCESS_ROLES: broker,controller
      KAFKA_SERVER_DEFAULT_PARTITIONS: 2
      KAFKA_BROKER_PORT: 9092
      KAFKA_CONTROLLER_PORT: 9093
      KAFKA_CONTROLLER_QUORUM_VOTERS: 1@kafka_1:9093,2@kafka_2:9093
    ports:
      - "9092:9092"
      - "9093:9093"
    volumes:
      - ./kafka/1/volume_data:/var/log/kafka
    networks:
     - kafka_network
  kafka_2:
    container_name: kafka_2
    image: josebarrueta/kafka:3.3.2
    hostname: kafka_2
    restart: always
    environment:
      KAFKA_CLUSTER_ID: hXXhoCVLSzm8HZ_1KUlX3Q
      KAFKA_SERVER_NODE_ID: 2
      KAFKA_SERVER_PROCESS_ROLES: broker,controller
      KAFKA_SERVER_DEFAULT_PARTITIONS: 2
      KAFKA_CONTROLLER_QUORUM_VOTERS: 1@kafka_1:9093,2@kafka_2:9093
    ports:
      - "9094:9092"
      - "9095:9093"
    volumes:
      - ./kafka/2/volume_data:/var/log/kafka
    networks:
      - kafka_network
networks:
  kafka_network:
    
```