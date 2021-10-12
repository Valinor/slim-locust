FROM redhat/ubi8:8.4-211

RUN yum install -y python3-pip python3 && \
    yum install -y gcc python3-devel file diffutils make && \
    pip3 install locust==2.4.0 && \
    yum autoremove -y gcc python3-devel file diffutils make && \
    yum clean all && \
    rm -rf /var/lib/rpm

EXPOSE 8089 5557

RUN useradd --create-home locust
USER locust
WORKDIR /home/locust
ENTRYPOINT ["locust"]

# turn off python output buffering
ENV PYTHONUNBUFFERED=1
