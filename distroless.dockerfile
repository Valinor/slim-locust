ARG DEBIAN_VERSION=latest
FROM debian:${DEBIAN_VERSION} as build-venv
ARG DEBIAN_VERSION
ARG LOCUST_VERSION=latest

ENV PIP_BREAK_SYSTEM_PACKAGES 1
FROM debian:12-slim AS build
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends --yes python3-venv gcc libpython3-dev && \
    python3 -m venv /venv && \
    /venv/bin/pip install --upgrade pip setuptools wheel

FROM build AS build-venv
RUN /venv/bin/pip install --disable-pip-version-check locust


FROM gcr.io/distroless/python3-debian12
COPY --from=build-venv /venv /venv
ENTRYPOINT ["/venv/bin/locust"]
