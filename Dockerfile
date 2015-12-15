FROM ubuntu:trusty
MAINTAINER Héctor Ramón Jiménez <hector0193@gmail.com>

# Install generic dependencies
RUN apt-get update && apt-get install -y curl build-essential pkg-config cmake git uuid-dev

# Install libsodium
RUN curl https://download.libsodium.org/libsodium/releases/libsodium-1.0.5.tar.gz | tar xvz && \
  cd libsodium-1.0.5 && ./configure && make check && make install && ldconfig && \
  cd / && rm -rf *

# Install ZeroMQ
RUN curl http://download.zeromq.org/zeromq-4.1.3.tar.gz | tar xvz && \
  cd zeromq-4.1.3 && ./configure && make install && ldconfig && \
  cd / && rm -rf
