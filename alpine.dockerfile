FROM alpine

RUN apk add --no-cache python3 py3-setuptools py3-msgpack  py3-requests py3-gevent && \
    apk add --no-cache --virtual buildpackage py3-pip gcc make diffutils file python3-dev musl-dev g++ libffi-dev zeromq-dev && \
    pip3 install locust && \
    pip3 cache purge && \
    apk del buildpackage && \
    apk add --no-cache libzmq

EXPOSE 8089 5557

WORKDIR /tmp
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
