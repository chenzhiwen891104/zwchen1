FROM harbor.com/library/jdk:8u292
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    echo 'Asia/Shanghai' >/etc/timezone && \
        mkdir -p /opt/project
COPY ICAgent /opt/apm
COPY jmx_prometheus_javaagent-0.16.1.jar /opt/prom/jmx_prometheus_javaagent-0.16.1.jar
COPY config.yml /opt/prom/config.yml
ADD entrypoint.sh /entrypoint.sh
WORKDIR /opt/project
CMD ["bash", "/entrypoint.sh"]