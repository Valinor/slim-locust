ARG FEDORA_VERSION=latest
from fedora:${FEDORA_VERSION}
ARG FEDORA_VERSION
ARG LOCUST_VERSION=latest

RUN yum install -y python3-pip python3-gevent python3-flask python3-werkzeug python3-msgpack python3-zmq python3-configargparse python3-requests python3-psutil python3-flask-basicauth python3-flask-cors python3-brotli python3-typing-extensions python3-roundrobin python3-certifi &&\
    if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi &&\
    pip3 cache purge &&\
    yum autoremove -y python3-pip &&\
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
