from fedora:34

RUN yum install -y python3 &&\
    yum install -y gcc python3-devel file diffutils make python3-pip &&\
    pip3 install locust==2.4.1 &&\
    pip3 cache purge &&\
    yum autoremove -y gcc python3-devel file diffutils make python3-pip &&\
    yum clean all &&\
    rm -rf /var/lib/rpm


EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
