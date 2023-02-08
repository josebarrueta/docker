FROM amazoncorretto:17.0.6-al2

ARG UID=1000
ARG GID=$UID

ARG APACHE_DOWNLOAD_MIRROR=https://downloads.apache.org
ARG KAFKA_VERSION=3.4.0
ARG KAFKA_FILE=kafka_2.13-$KAFKA_VERSION.tgz
ARG KAFKA_SHA512="2c405149c065627ce2125088dfcce0a4dc23aebaa72c1157736d5829cb5cbef273c0915ec55d2d8ba38e5e0524f0720f43e07d7d677439cd2ac7bea618caa65b"

ENV KAFKA_HOME /usr/local/kafka
ENV KAFKA_USERNAME=kafka
ENV KAFKA_GROUPNAME=$KAFKA_USERNAME

# Create new user and group
RUN yum install -y gzip tar shadow-utils nc \
    && groupadd -g $GID $KAFKA_GROUPNAME \
    && useradd -u $UID -g $GID $KAFKA_USERNAME \
    && mkdir -p /usr/local/kafka \
    && yum clean all \
    && rm -rf /var/cache/yum

# Download kafka tar file, extract it, create new user/group, then give ownership of
# the kakfa files to the new user
RUN curl -LJO $APACHE_DOWNLOAD_MIRROR/kafka/$KAFKA_VERSION/$KAFKA_FILE \
    && echo "$KAFKA_SHA512  $KAFKA_FILE" | sha512sum  -c \
    && tar -xzf $KAFKA_FILE -C $KAFKA_HOME --strip-components 1 \
    && chown -R $KAFKA_USERNAME:$KAFKA_GROUPNAME $KAFKA_HOME \
    && rm $KAFKA_FILE && rm -rf $KAFKA_HOME/site-docs && rm -rf $KAFKA_HOME/config && rm -rf $KAFKA_HOME/bin/windows

LABEL version=$KAFKA_VERSION