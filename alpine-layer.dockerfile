FROM alpine AS builder
ENV PYROOT=/venv
ENV PYTHONUSERBASE=$PYROOT
WORKDIR /

RUN apk add --no-cache --virtual buildpackage py3-pip gcc make diffutils file python3-dev musl-dev g++ libffi-dev zeromq-dev
WORKDIR /
COPY Pipfile ./
RUN pip3 --no-cache-dir install pipenv && pipenv install --skip-lock && PIP_USER=1 pipenv sync --system
RUN find /venv -type d -name tests -exec rm -rf {} \; || :
RUN find /venv -type d -name test -exec rm -rf {} \; || :
RUN find /venv -type d -name __pycache__  -exec rm -rf {} \; || :

FROM alpine
RUN adduser -D user && \
    apk add --no-cache python3 py3-setuptools py3-msgpack libzmq 
COPY --from=builder /venv /venv

ENV PATH="/venv/bin:$PATH"
ENV PYTHONPATH="/venv/lib/python3.9/site-packages/"

EXPOSE 8089 5557
USER user
WORKDIR /tmp
ENTRYPOINT ["locust"]
CMD ["--version"]
# turn off python output buffering
ENV PYTHONUNBUFFERED=1
