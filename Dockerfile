FROM ubuntu:trusty
MAINTAINER Héctor Ramón Jiménez <hector0193@gmail.com>

# Install generic dependencies
RUN apt-get update && apt-get install -y curl build-essential pkg-config

# Install libsodium
RUN curl https://download.libsodium.org/libsodium/releases/libsodium-1.0.5.tar.gz | tar xvz
RUN cd libsodium-1.0.5 && ./configure && make check && make install && ldconfig

# Install ZeroMQ
RUN curl http://download.zeromq.org/zeromq-4.1.3.tar.gz | tar xvz
RUN cd zeromq-4.1.3 && ./configure && make install && ldconfig

# Install CZMQ
RUN curl -L https://github.com/zeromq/czmq/archive/v3.0.2.tar.gz | tar xvz
RUN apt-get install -y libtool autoconf automake
RUN cd czmq-3.0.2 && ./autogen.sh && ./configure && make install && ldconfig

# Remove sources
RUN rm -rf libsodium-1.0.5 zeromq-4.1.3 czmq-3.0.2
