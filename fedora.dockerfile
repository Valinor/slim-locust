from fedora

RUN yum install -y python3 &&\
    yum install -y gcc python3-devel file diffutils make python3-pip &&\
    pip3 install locust &&\
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
