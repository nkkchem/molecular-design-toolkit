FROM python:3.6-slim
# This is the environment that "docker-make" will run in on the CI server
# The expected build context is the root of the MDT repository
RUN apt-get -q update && apt-get -q install -y curl git

# Install docker CLI only, not the full engine
WORKDIR /tmp
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

ADD . /opt/molecular-design-toolkit
RUN pip install -r /opt/molecular-design-toolkit/DockerMakefiles/requirements.txt

