# Nginx_ldap_dockerfile
Dockerizing nginx with LDAP module based on `centos:7`.
Because [the official nginx docker image](https://github.com/nginxinc/docker-nginx) does not support LDAP module by itself, you have to get nginx source and compile with LDAP module. This image include [nginx-auth-ldap module](https://github.com/kvspb/nginx-auth-ldap), so you don't need to compile. 

## Install
You need your nginx configuration file.

## Versions
A nginx version is specified in [Dockerfile](https://github.com/shyr/nginx_ldap_dockerfile/blob/master/Dockerfile). Fix ENV NGINX_VERSION as what you want.


### To more details about nginx configuration, please refer to followings.<br>
http://www.allgoodbits.org/articles/view/29

### How to build
```
$ docker build -t nexhub/nginx .
```
