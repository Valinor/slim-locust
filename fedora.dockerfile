ARG FEDORA_VERSION=latest
from fedora:${FEDORA_VERSION}
ARG FEDORA_VERSION
ARG LOCUST_VERSION=latest

RUN yum install -y python3 python3-psutil &&\
    yum install -y python3-pip &&\
    if [[ ${LOCUST_VERSION} == "latest" ]]; then pip3 install locust; else pip3 install locust==${LOCUST_VERSION}; fi &&\
    pip3 cache purge &&\
    yum autoremove -y gcc python3-devel file diffutils make python3-pip &&\
    yum install -y python3-setuptools &&\
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
