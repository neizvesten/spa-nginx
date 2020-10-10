#!/bin/bash
docker rm -f spa-nginx-second
docker image rm `docker image ls spa-nginx-second -q`
docker build --build-arg APP_BASE_PREFIX -f Dockerfile.second -t spa-nginx-second .
docker run --name spa-nginx-second -p 3000:80 spa-nginx-second
