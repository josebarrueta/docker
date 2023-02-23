FROM confluentinc/cp-server-connect:latest

RUN confluent-hub install --no-prompt snowflakeinc/snowflake-kafka-connector:1.8.2 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.6.3 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-salesforce-bulk-api:2.1.0 \
   && confluent-hub install --no-prompt castorm/kafka-connect-http:0.8.11