# kivio-proxy
Nginx proxy for Kivios Docker infrastructure.

This is latest Nginx image with an adapted configuration to serve
multiple Docker containers at port 80 so containers don't have to be 
exposed with their internal ports.

## Usage
Docker container can be build with `mvn clean package docker:build`.

Container can be started with `docker run -d --name kivio-proxy --restart unless-stopped --network=kivio kivio-proxy`.

It is important conatiner runs with `--network`-Flag, so NGINX can use DNS resolving
for upstream servers. It is convenient naming upstream server hostnames like the containers
name or alias. 

## Build
On local machine image can be build with `docker build -t kivio-proxy:latest .`

## Network
Therefore containers can see each other and be resolved via DNS inside each container,
a user-defined network named *kivio* is created:

`docker network create --driver bridge kivio`

## Documentation
Configuration is based on the following resources:

* [Use NGINX As A Reverse Proxy To Your Containerized Docker Applications](https://www.thepolyglotdeveloper.com/2017/03/nginx-reverse-proxy-containerized-docker-applications/)
* [Virtual Hosts on nginx (CSC309)](https://gist.github.com/soheilhy/8b94347ff8336d971ad0)
