FROM amazoncorretto:17.0.5-al2

ARG USERNAME=kafka
ARG GROUPNAME=$USERNAME
ARG UID=1000
ARG GID=$UID
ARG KAFKA_FILE=kafka_2.13-3.3.1.tgz
ARG KAFKA_SHA256="18ad8a365fb111de249d3bb8bf3c96cd1af060ec8fb3e3d1fc4a7ae10d9042de"

ENV KAFKA_HOME /usr/local/kafka

WORKDIR $KAFKA_HOME

# Download kafka tar file, extract it, create new user/group, then give ownership of 
# the kakfa files to the new user

RUN curl -LJO https://dlcdn.apache.org/kafka/3.3.1/$KAFKA_FILE \
    && echo "$KAFKA_SHA256  $KAFKA_FILE" | sha256sum  -c \
    && yum install -y gzip tar shadow-utils \
    && tar -xzf $KAFKA_FILE -C . --strip-components 1 && rm $KAFKA_FILE \
    && groupadd -g $GID $GROUPNAME \
    && useradd -u $UID -g $GID $USERNAME \
    && chown -R $USERNAME:$GROUPNAME . \
    && yum clean all

COPY entrypoint.sh /usr/local/bin

RUN chown $USERNAME:$GROUPNAME /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh   

USER $USERNAME

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]