docker build -t="ngnix_proxy" .
docker stop ngnix_proxy;  docker rm ngnix_proxy; docker run -it -p 80:80 -p 443:443 --name=ngnix_proxy  ngnix_proxy
