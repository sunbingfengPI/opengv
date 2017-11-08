FROM ubuntu:14.04


# Install apt-getable dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake python-dev libboost-python-dev \
    python-numpy libeigen3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Prepare directories
RUN mkdir /code
WORKDIR /code


# Add repository files
ADD . /code/


# Install opengv from source
RUN mkdir -p build && cd build && \
    cmake .. -DBUILD_TESTS=ON -DBUILD_PYTHON=ON && \
    make
