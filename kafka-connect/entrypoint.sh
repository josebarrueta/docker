#!/bin/bash

# copy the template files into the config directory with the actual values from the environment.
set -x

mkdir -p $KAFKA_HOME/config

# evaluate and create server.properties file
eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/connect-distributed.properties)\"" >$KAFKA_HOME/config/connect-distributed.properties

# evaluate and create log4j.properties file
#eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/log4j.properties)\"" > $KAFKA_HOME/config/log4j.properties
cp /usr/tmp/connect-log4j.properties $KAFKA_HOME/config/

# evaluate and create tools-log4j.properties file
#eval "echo \"$(sed 's/"/\\"/g' /usr/tmp/tools-log4j.properties)\"" > $KAFKA_HOME/config/tools-log4j.properties
cp /usr/tmp/tools-log4j.properties $KAFKA_HOME/config/

echo "Starting Kafka Connect..."

$KAFKA_HOME/bin/connect-distributed.sh config/connect-distributed.properties
