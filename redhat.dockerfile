FROM redhat/ubi8

RUN yum install -y python3-pip python3 && \
    yum install -y gcc gcc-c++ python3-devel file diffutils make && \
    pip3 install packaging && \
    pip3 install locust && \
    rm -rf /root/.cache &&\
    yum autoremove -y gcc python3-devel file diffutils make && \
    yum clean all &&\
    rm -rf /var/lib/rpm

EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
