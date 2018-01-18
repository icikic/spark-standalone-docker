FROM openjdk:8-jre-slim

ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1" \
    DOCKERIZE_VERSION=v0.5.0 \
    SPARK_VERSION=2.2.1 \
    HADOOP_VERSION=2.7

RUN set -ex && \
    apt-get update && \
    apt-get install -y curl procps && \
    apt-get clean && \
    curl --fail --retry 3 --retry-delay 1 -L \
        https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
        | tar xzv -C /usr/local/bin && \
    curl --fail --retry 3 --retry-delay 1 -L \
        http://mirrors.ukfast.co.uk/sites/ftp.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz \
        | tar xzv -C /opt && \
        ln -s /opt/spark-$SPARK_VERSION-bin-hadoop${HADOOP_VERSION} /opt/spark

ENV SPARK_HOME /opt/spark

WORKDIR $SPARK_HOME
