#!/bin/bash
docker rm -f spa-nginx-third
docker image rm `docker image ls spa-nginx-third -q`
docker build --build-arg APP_BASE_PREFIX -f Dockerfile.third -t spa-nginx-third .
docker run --name spa-nginx-third -p 3000:80 spa-nginx-third
