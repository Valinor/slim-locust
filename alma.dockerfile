ARG ALMA_VERSION=minimal
from almalinux:${ALMA_VERSION}
ARG ALMA_VERSION
ARG LOCUST_VERSION=latest

RUN microdnf -y update && microdnf install -y python3-pip gcc python3-devel &&\
    if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi &&\
    pip3 cache purge &&\
    microdnf remove -y gcc python3-devel &&\
    microdnf clean all &&\
    rm -rf /var/lib/rpm


EXPOSE 8089 5557

WORKDIR /tmp
ENTRYPOINT ["locust"]
CMD ["--version"]
# turn off python output buffering
ENV PYTHONUNBUFFERED=1
