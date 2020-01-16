## grpccpp
Grpc for c++ is not typically shipped with most linux distributions.  
Grpc needs to be built from src but at time of writing does not build with gcc 8.  
Rather that install a compatible version of gcc (7), this project  
builds the code using gcc7 inside a docker container.  
### Prerequisites
1.) Recent version of Docker. Follow these instruction for fedora 29,30,31    
https://docs.docker.com/install/linux/docker-ce/fedora/  
### Building the container
docker build . -t grpc_cpp:latest  
### Running the container
docker run -i -t grpc_cpp:latest /bin/bash  
### Building inside the container
bash> cd /src/github.com/grpc/examples/cpp/helloworld/  
bash> make  
### Building local src inside the container 
Recommended approach is to run the container mounting the local src directory then  
execute a make command  on this code.  
NB May also need to copy over dependencies from container. Use ldd inside container to find out dependencies and then
copy them out of the container and run code pointing to local libraries.  
  
For an example of this process, cd into the example directory and execute ./build.sh  
 

  

