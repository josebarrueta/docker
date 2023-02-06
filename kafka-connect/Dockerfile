FROM josebarrueta/kafka-base:3.3.2

USER root

COPY entrypoint.sh /usr/local/bin
COPY template/ /usr/tmp
COPY plugins/ $KAFKA_HOME/libs

# Change the owner of the copied files to kafka user
RUN chown $USERNAME:$GROUPNAME /usr/local/bin/entrypoint.sh \
     && chown $USERNAME:$GROUPNAME $KAFKA_HOME/libs \
     && chmod +x /usr/local/bin/entrypoint.sh

WORKDIR $KAFKA_HOME
USER $KAFKA_USERNAME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]