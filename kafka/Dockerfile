FROM amazoncorretto:17.0.5-al2

ARG USERNAME=kafka
ARG GROUPNAME=$USERNAME
ARG UID=1000
ARG GID=$UID
ARG KAFKA_FILE=kafka_2.13-3.3.1.tgz
ARG KAFKA_SHA256="18ad8a365fb111de249d3bb8bf3c96cd1af060ec8fb3e3d1fc4a7ae10d9042de"

ENV KAFKA_HOME /usr/local/kafka

# Create new user and group
RUN yum install -y gzip tar shadow-utils \
    && groupadd -g $GID $GROUPNAME \
    && useradd -u $UID -g $GID $USERNAME \
    && mkdir -p /usr/local/kafka \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY entrypoint.sh /usr/local/bin
COPY template/ /usr/tmp

# Download kafka tar file, extract it, create new user/group, then give ownership of 
# the kakfa files to the new user

RUN curl -LJO https://dlcdn.apache.org/kafka/3.3.1/$KAFKA_FILE \
    && echo "$KAFKA_SHA256  $KAFKA_FILE" | sha256sum  -c \
    && tar -xzf $KAFKA_FILE -C $KAFKA_HOME --strip-components 1 \
    && chown -R $USERNAME:$GROUPNAME $KAFKA_HOME \
    && chown $USERNAME:$GROUPNAME /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && rm $KAFKA_FILE && rm -rf $KAFKA_HOME/site-docs && rm -rf $KAFKA_HOME/config
    
WORKDIR $KAFKA_HOME
USER $USERNAME
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]