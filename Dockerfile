FROM nginx

# 如果是国内机器，需要替换 sources
# ADD conf/cn_sources.list /etc/apt/sources.list

RUN apt-get update

# install base tools
RUN apt-get install -y -qq openssl 




#WORKDIR /etc/nginx
##https://www.cnblogs.com/fengyuduke/p/11232662.html 
#RUN openssl genrsa -out client.key 4096
#RUN openssl genrsa -out server.key 1024
#RUN openssl req -new -key server.key -out server.csr -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US'
#RUN cp server.key server.key.org
#RUN openssl rsa -in server.key.org -out server.key
#RUN openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

RUN rm -rf conf/nginx/*
ADD conf/nginx/  /etc/nginx/ 
ADD conf/cert  /etc/nginx/cert 


EXPOSE 80
EXPOSE 443

CMD nginx && tail -F /var/log/nginx/access.log

 

