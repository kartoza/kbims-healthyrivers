#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
# Note this base image is based on debian
ARG BIMS_TAG=latest
FROM kartoza/kbims_uwsgi:${BIMS_TAG}
MAINTAINER Dimas Ciputra<dimas@kartoza.com>

COPY REQUIREMENTS.txt /REQUIREMENTS.txt
RUN pip install -r /REQUIREMENTS.txt

ARG HEALTHYRIVERS_TAG=develop
WORKDIR /usr/src
RUN git clone --depth=1 --branch ${HEALTHYRIVERS_TAG} git://github.com/kartoza/healthyrivers.git /usr/src/HEALTHYRIVERS_BIMS
RUN cd /usr/src/HEALTHYRIVERS_BIMS/django_project && git submodule init && git submodule update
RUN mkdir -p /usr/src/healthyrivers
RUN cp -r HEALTHYRIVERS_BIMS/django_project/* /usr/src/healthyrivers

WORKDIR /usr/src/healthyrivers

ADD uwsgi.conf /usr/src/healthyrivers/uwsgi.conf

CMD ["uwsgi", "--ini", "/usr/src/healthyrivers/uwsgi.conf"]
