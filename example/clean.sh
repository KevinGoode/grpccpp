docker run -v ${PWD}/src:/cpp-dev grpc_cpp:latest make clean
rm -f ./src/*.so.*
rm -f ./src/*.so
