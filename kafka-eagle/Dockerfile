FROM openjdk:8-bullseye

ENV KE_HOME=/opt/efak
ENV EFAK_VERSION=2.1.0
# Set config defaults
ENV EFAK_CLUSTER_JMX_ACL=false
ENV EFAK_CLUSTER_JMX_USER=keadmin
ENV EFAK_CLUSTER_JMX_PASSWORD=keadmin123
ENV EFAK_CLUSTER_JMX_SSL=false
ENV EFAK_CLUSTER_JMX_TRUSTSTORE_LOCATION='/Users/dengjie/workspace/ssl/certificates/kafka.truststore'
ENV EFAK_CLUSTER_JMX_TRUSTSTORE_PASSWORD=ke123456
ENV EFAK_CLUSTER_JMX_URI='service:jmx:rmi:///jndi/rmi://%s/jmxrmi'
ENV EFAK_CLUSTER_KAFKA_EAGLE_BROKER_SIZE=1
ENV EFAK_CLUSTER_KAFKA_EAGLE_OFFSET_STORAGE=kafka
ENV EFAK_CLUSTER_KAFKA_EAGLE_SASL_ENABLE=false
ENV EFAK_CLUSTER_KAFKA_EAGLE_SASL_PROTOCOL=SASL_PLAINTEXT
ENV EFAK_CLUSTER_KAFKA_EAGLE_SASL_MECHANISM=SCRAM-SHA-256
ENV EFAK_CLUSTER_KAFKA_EAGLE_SASL_JAAS_CONFIG='org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="admin-secret";'
ENV EFAK_CLUSTER_KAFKA_EAGLE_SASL_CGROUP_ENABLE=false
ENV EFAK_CLUSTER_KAFKA_EAGLE_SASL_CGROUP_TOPICS=kafka_ads01,kafka_ads02
ENV EFAK_CLUSTER_ZK_LIST=zookeeper:2181
ENV EFAK_DB_DRIVER=org.sqlite.JDBC
ENV EFAK_DB_USERNAME=root
ENV EFAK_DB_PASSWORD=smartloli
ENV EFAK_DB_URL=jdbc:sqlite:/hadoop/efak/db/ke.db
ENV EFAK_KAFKA_CLUSTER_ALIAS='cluster'
ENV EFAK_KAFKA_ZK_LIMIT_SIZE=25
ENV EFAK_METRICS_CHARTS=false
ENV EFAK_METRICS_RETAIN=30
ENV EFAK_SQL_DISTRIBUTED_MODE_ENABLE=FALSE
ENV EFAK_SQL_FIX_ERROR=false
ENV EFAK_SQL_TOPIC_PREVIEW_RECORDS_MAX=10
ENV EFAK_SQL_TOPIC_RECORDS_MAX=5000
ENV EFAK_SQL_WORKNODE_PORT=8787
ENV EFAK_SQL_WORKNODE_RPC_TIMEOUT=300000
ENV EFAK_SQL_WORKNODE_SERVER_PATH='/Users/dengjie/workspace/kafka-eagle-plus/kafka-eagle-common/src/main/resources/works'
ENV EFAK_SQL_WORKNODE_FETCH_THRESHOLD=5000
ENV EFAK_SQL_WORKNODE_FETCH_TIMEOUT=20000
ENV EFAK_TOPIC_TOKEN=keadmin
ENV EFAK_WEBUI_PORT=8048
ENV EFAK_ZK_ACL_ENABLE=false
ENV EFAK_ZK_ACL_SCHEMA=digest
ENV EFAK_ZK_ACL_USERNAME=test
ENV EFAK_ZK_ACL_PASSWORD=test123
ENV EFAK_ZK_CLUSTER_ALIAS='cluster'


ADD system-config.properties /tmp
ADD entrypoint.sh /usr/bin

#RUN apk --update add wget gettext tar bash sqlite
RUN apt-get update && apt-get upgrade -y && apt-get install -y sqlite3 gettext

#get and unpack kafka eagle
RUN mkdir -p /opt/efak/conf;cd /opt && \
    wget https://github.com/smartloli/kafka-eagle-bin/archive/v${EFAK_VERSION}.tar.gz && \
    tar zxvf v${EFAK_VERSION}.tar.gz -C efak --strip-components 1 && \
    cd efak;tar zxvf efak-web-${EFAK_VERSION}-bin.tar.gz --strip-components 1 && \
    rm efak-web-${EFAK_VERSION}-bin.tar.gz && \
    chmod +x /opt/efak/bin/ke.sh

EXPOSE 8048 8080

ENTRYPOINT ["entrypoint.sh"]

WORKDIR /opt/efak


