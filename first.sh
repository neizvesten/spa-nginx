#!/bin/bash
docker rm -f spa-nginx-first
docker image rm `docker image ls spa-nginx-first -q`
docker build -f Dockerfile.first -t spa-nginx-first .
docker run --name spa-nginx-first -p 3000:80 spa-nginx-first
