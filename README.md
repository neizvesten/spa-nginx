This is simple example of nginx-in-docker parametrization,  
aimed at application base prefix (http​://localhost/**these/prefix**/index.html)  
  
1) Hardcoded in Dockerfile - suitable for simple purposes, but has no reusability  
Run  
`./first.sh`  
Check  
`curl localhost:3000/index.html`  
  
2) Passed during image building - allow not to update the repository too often,  
   but require to build new image for each prefix  
Run  
`unset APP_BASE_PREFIX && ./second.sh`  
Check  
`curl localhost:3000/index.html`  
Run2  
`export APP_BASE_PREFIX="/build" && ./second.sh`  
Check2  
`curl localhost:3000/build/index.html`  
  
3) Passed during container starting - both allow to keep repository unchanged,  
   and don't require to rebuild image, just re-run container.  
Run:  
`unset APP_BASE_PREFIX && ./third.sh`  
Check  
`curl localhost:3000/index.html`  
Run2  
`export APP_BASE_PREFIX="/build" && ./third.sh`  
Check2  
`curl localhost:3000/build/index.html`  
Run3  
`docker rm -f spa-nginx-third && \`  
`export APP_BASE_PREFIX="/run" && \`  
`docker run -e APP_BASE_PREFIX --name spa-nginx-third -p 3000:80 spa-nginx-third`  
Check3  
`curl localhost:3000/run/index.html`  
