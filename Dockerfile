FROM python:3.9.16

RUN apt-get update \
    && apt-get -yq install \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/app
WORKDIR /opt/app

ADD web_app /opt/app/web_app
ADD entrypoint.sh /opt/app/web_app/

ARG BUILD_VERSION=0.0.0.d0+local
ENV BUILD_VERSION=$BUILD_VERSION

RUN pip install -r /opt/app/web_app/requirements.txt

EXPOSE 8000

CMD ["/opt/app/web_app/entrypoint.sh", "start"]
