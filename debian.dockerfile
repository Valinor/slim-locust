ARG DEBIAN_VERSION=latest
FROM debian:${DEBIAN_VERSION}
ARG DEBIAN_VERSION
ARG LOCUST_VERSION=latest

ENV PIP_BREAK_SYSTEM_PACKAGES 1

RUN apt update && \
    apt install --no-install-recommends --yes python3-pip python3-six python3-zmq python3-msgpack python3-werkzeug python3-geventhttpclient python3-gevent python3-flask-basicauth  python3-typing-extensions  python3-flask python3-roundrobin python3-configargparse  python3-jinja2 python3-click python3-itsdangerous python3-psutil && \
    bash -c 'if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi' &&\ 
    pip3 cache purge && \
    apt autoremove --purge --yes python3-pip && \
    apt install --no-install-recommends --yes python3-setuptools python3-pkg-resources && \
    apt-get purge --yes --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists

EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]
CMD ["--version"]
# turn off python output buffering
ENV PYTHONUNBUFFERED=1
