ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}
ARG LOCUST_VERSION=latest
ARG ALPINE_VERSION

LABEL "github"="https://github.com/Valinor/slim-locust"
LABEL "dockerhub"="https://hub.docker.com/repository/docker/damballa/locust/"
LABEL "maintener"="https://github.com/Valinor"
LABEL "version"="latest"

RUN apk add --no-cache python3 py3-setuptools py3-msgpack  py3-requests py3-gevent && \
    apk add --no-cache --virtual buildpackage py3-pip gcc make diffutils file python3-dev musl-dev g++ libffi-dev zeromq-dev && \
    if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi &&\
    pip3 cache purge && \
    apk del buildpackage && \
    apk add --no-cache libzmq && \
    find /usr/lib -type d -name __pycache__  -exec rm -rf {} \; || : && \
    find /usr/lib -type d -name test  -exec rm -rf {} \; || : && \
    find /usr/lib -type d -name tests  -exec rm -rf {} \; || : 

EXPOSE 8089 5557

WORKDIR /
ENTRYPOINT ["locust"]
CMD ["--version"]
# turn off python output buffering
ENV PYTHONUNBUFFERED=1
