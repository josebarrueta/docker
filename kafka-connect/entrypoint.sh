#!/bin/bash

# copy the template files into the config directory with the actual values from the environment.
set -x

mkdir -p $KAFKA_HOME/config

# evaluate and create server.properties file
eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/server.properties)\"" >$KAFKA_HOME/config/connect-distributed.properties

# evaluate and create log4j.properties file
#eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/log4j.properties)\"" > $KAFKA_HOME/config/log4j.properties
cp /usr/tmp/log4j.properties $KAFKA_HOME/config/

# evaluate and create tools-log4j.properties file
#eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/tools-log4j.properties)\"" > $KAFKA_HOME/config/tools-log4j.properties
cp /usr/tmp/tools-log4j.properties $KAFKA_HOME/config/

# SIGTERM-handler
term_handler() {
  echo "SIGTERM signal caught, stopping kafka: $HOSTNAME"
  $KAFKA_HOME/bin/kafka-server-stop.sh
  exit 143 # 128 + 15 -- SIGTERM
}

trap 'term_handler' SIGTERM
echo "Starting Kafka Connect..."

$KAFKA_HOME/bin/kafka-server-start.sh config/connect-distributed.properties
