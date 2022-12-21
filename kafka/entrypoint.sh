#!/bin/bash

KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"

$KAFKA_HOME/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

$KAFKA_HOME/bin/kafka-server-start.sh config/kraft/server.properties