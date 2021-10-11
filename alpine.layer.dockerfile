FROM alpine AS base

RUN apk add --no-cache python3 py3-pip py3-gevent libzmq

FROM base AS builder
RUN apk add --no-cache --virtual buildpackage gcc make diffutils file python3-dev musl-dev g++ libffi-dev zeromq-dev
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip3 install locust

FROM base

COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

EXPOSE 8089 5557

WORKDIR /tmp
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
