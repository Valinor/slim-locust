ARG DEBIAN_VERSION=latest
FROM debian:${DEBIAN_VERSION} AS build
ARG DEBIAN_VERSION
ARG LOCUST_VERSION=latest

ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN apt update && \
    apt install --no-install-recommends --yes python3-venv gcc libpython3-dev python3-pip python3-six python3-zmq python3-msgpack python3-werkzeug python3-geventhttpclient python3-gevent python3-flask-basicauth  python3-typing-extensions  python3-flask python3-roundrobin python3-configargparse  python3-jinja2 python3-click python3-itsdangerous python3-psutil patchelf && \
    python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip setuptools wheel staticx pyinstaller
RUN bash -c 'if [[ ${LOCUST_VERSION} == "latest" ]]; then /venv/bin/pip install locust; else /venv/bin/pip install locust==${LOCUST_VERSION}; fi' 
RUN /venv/bin/pyinstaller -F /venv/bin/locust
RUN /venv/bin/staticx -l ./usr/lib/x86_64-linux-gnu/libm.so.6 -l ./usr/lib/x86_64-linux-gnu/librt.so.1 dist/locust /locust
RUN mkdir dist/tmp


FROM scratch
EXPOSE 8089 5557
USER 65535

COPY --chown=65535:65535 --from=build dist/tmp /tmp
COPY --chown=65535:65535 --from=build /locust /
ENTRYPOINT ["/locust"]
CMD ["--version"]
# turn off python output buffering
ENV PYTHONUNBUFFERED=1
