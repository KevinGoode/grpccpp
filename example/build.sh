# Build code
docker run -v ${PWD}/src:/cpp-dev grpc_cpp:latest make
# Copy over dependencies
docker run -v ${PWD}/src:/cpp-dev grpc_cpp:latest cp /usr/local/lib/libgrpc++.so.1 ./
docker run -v ${PWD}/src:/cpp-dev grpc_cpp:latest cp /usr/local/lib/libgrpc.so.7 ./
docker run -v ${PWD}/src:/cpp-dev grpc_cpp:latest cp /usr/local/lib/libgrpc++_reflection.so.1 ./
echo "To run code, you need two shells.  In one shell execute : src> export LD_LIBRARY_PATH=`pwd`/src; ./hello_server"
echo "In a second shell execute : src> export LD_LIBRARY_PATH=`pwd`/src; ./hello_client"



