FROM josebarrueta/kafka-base:3.3.2

COPY entrypoint.sh /usr/local/bin
COPY template/ /usr/tmp

# Download kafka tar file, extract it, create new user/group, then give ownership of 
# the kakfa files to the new user

RUN chown $KAFKA_USERNAME:$KAFKA_GROUPNAME /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh

WORKDIR $KAFKA_HOME
USER $KAFKA_USERNAME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]