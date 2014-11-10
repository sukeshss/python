FROM qburstdevops/base

Maintainer QBurst

# Install Packages

RUN apt-get update -y && apt-get install --no-install-recommends -y -q build-essential python2.7 python2.7-dev python-pip git memcached libev4 libev-dev gcc libblas-dev liblapack-dev gfortran libxslt1-dev libxml2-dev

RUN pip install -U pip

RUN pip install virtualenv

# Set instructions on build.

RUN virtualenv /env

ADD requirements.txt /app/
RUN /env/bin/pip install -r /app/requirements.txt
ADD . /app

