#!/bin/bash

# copy the template files into the config directory with the actual values from the environment.

mkdir -p $KAFKA_HOME/config

# evaluate and create server.properties file
eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/server.properties)\"" >$KAFKA_HOME/config/server.properties

# evaluate and create log4j.properties file
#eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/log4j.properties)\"" > $KAFKA_HOME/config/log4j.properties
cp /usr/tmp/log4j.properties $KAFKA_HOME/config/

# evaluate and create tools-log4j.properties file
#eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/tools-log4j.properties)\"" > $KAFKA_HOME/config/tools-log4j.properties
cp /usr/tmp/tools-log4j.properties $KAFKA_HOME/config/

set -x

export KAFKA_CLUSTER_ID=${KAFKA_CLUSTER_ID:-$($KAFKA_HOME/bin/kafka-storage.sh random-uuid)}

if [ ! -f /var/log/kafka/meta.properties ]; then
  echo "Storage has not been formatted yet..."
  $KAFKA_HOME/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/server.properties
else
  echo "metadata file found, skipping formatting."
fi

# SIGTERM-handler
term_handler() {
  echo "SIGTERM signal caught, stopping kafka: $HOSTNAME"
  $KAFKA_HOME/bin/kafka-server-stop.sh
  exit 143 # 128 + 15 -- SIGTERM
}

trap 'term_handler' SIGTERM

echo "Starting Kafka..."

$KAFKA_HOME/bin/kafka-server-start.sh config/server.properties
