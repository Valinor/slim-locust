FROM debian

RUN apt update && \
    apt install --no-install-recommends --yes python3-psutil python3-pip python3 && \
    pip3 install locust && \
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

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
