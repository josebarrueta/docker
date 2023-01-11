# Kafka docker image

Simple Kafka image that starts with KRaft protocol, the image is based on the [amazoncorreto:17-al2](https://github.com/corretto/corretto-docker/blob/7996710c56ef95dba20bb0d5784b0e941dfdaa5b/17/jdk/al2/Dockerfile) image.

The server runs with a defined `kafka` user. 


Compose file to run it

```
version: '3.7'

services:
  kafka:
    image: arm64v8/kafka:3.3.1
    hostname: kafka
    environment:
      KAFKA_CLUSTER_ID: hXXhoCVLSzm8HZ_1KUlX3Q
      KAFKA_SERVER_NODE_ID: 1
      KAFKA_SERVER_PROCESS_ROLES: broker,controller
      KAFKA_SERVER_DEFAULT_PARTITIONS: 1
    ports:
      - "9092:9092"
      - "9093:9093"
    volumes:
      - ${HOME}/containers/kafka/volume_data:/var/log/kafka    
```
