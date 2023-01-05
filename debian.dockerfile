ARG DEBIAN_VERSION=latest
FROM debian:${DEBIAN_VERSION}
ARG DEBIAN_VERSION
ARG LOCUST_VERSION=latest

RUN apt update && \
    apt install --no-install-recommends --yes python3-psutil python3-pip python3 && \
    if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi &&\ 
    pip3 cache purge && \
    apt autoremove --purge --yes python3-pip && \
    apt install --no-install-recommends --yes python3-setuptools python3-pkg-resources python3-six && \
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
