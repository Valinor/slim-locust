ARG FEDORA_VERSION=latest
FROM fedora:${FEDORA_VERSION}
ARG FEDORA_VERSION
ARG LOCUST_VERSION=latest

RUN yum install -y python3-pip python3-gevent python3-psutil python3-flask-cors python3-brotli &&\
    if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi &&\
    pip3 cache purge &&\
    yum remove -y python3-pip &&\
    yum autoremove -y &&\
    yum clean all &&\
    rm -rf /var/lib/rpm


EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]
CMD ["--version"]
# turn off python output buffering
ENV PYTHONUNBUFFERED=1
