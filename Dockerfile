# Build with 'docker build . -t grpc_cpp:latest'
# Run container with 'docker run -i -t grpc_cpp:latest /bin/bash'
# Test you can build and run helloworld inside container
#(NB will need to run server in background: ./greeter_server &
# See https://grpc.io/docs/quickstart/cpp/
FROM gcc:7
RUN apt-get update
RUN apt-get install build-essential autoconf libtool pkg-config libgflags-dev -y
WORKDIR src
RUN mkdir github.com
WORKDIR github.com
RUN apt-get -y  install curl
RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
WORKDIR grpc
RUN git submodule update --init
RUN apt-get install gcc-7 g++-7 -y
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 50
RUN make
RUN make install
WORKDIR third_party/protobuf
RUN make && make install
