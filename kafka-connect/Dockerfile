FROM josebarrueta/kafka-base:3.4.0

USER root

COPY entrypoint.sh /usr/local/bin
COPY template/ /usr/tmp
COPY plugins/ $KAFKA_HOME/libs
COPY connectors/ /opt/connectors

# Change the owner of the copied files to kafka user

RUN chown $KAFKA_USERNAME:$KAFKA_GROUPNAME /usr/local/bin/entrypoint.sh \
    && chown -R $KAFKA_USERNAME:$KAFKA_GROUPNAME $KAFKA_HOME/libs/ \
    && chmod +x /usr/local/bin/entrypoint.sh

WORKDIR $KAFKA_HOME
USER $KAFKA_USERNAME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]