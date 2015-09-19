# Nginx_ldap_dockerfile
Dockerizing nginx with LDAP module based on `centos:7`.
Because [the official nginx docker image](https://github.com/nginxinc/docker-nginx) does not support LDAP module by itself, you have to get nginx source and compile with LDAP module. This image include [nginx-auth-ldap module](https://github.com/kvspb/nginx-auth-ldap), so you don't need to compile. 

## Install
Clone this.
```
git clone https://github.com/shyr/nginx_ldap_dockerfile.git
```

You need to have your nginx configuration file. Please modify [default.conf](https://github.com/shyr/nginx_ldap_dockerfile/blob/master/default.conf) and [conf/nginx.conf](https://github.com/shyr/nginx_ldap_dockerfile/blob/master/conf/nginx.conf) as your environment.

Then you can make you Nginx docker image.
```
$ docker build -t [YOUR_IMAGE_NAME] .
```


## Nginx Version
A nginx version is specified in [Dockerfile](https://github.com/shyr/nginx_ldap_dockerfile/blob/master/Dockerfile). Fix ENV NGINX_VERSION as what you want.

## You want to add another modules?
To add another module you need to modify Dockerfile.

1. Get module source and unzip.
2. Specify where the module exist with `./configure --add-module=[MODULE PATH]` command.

---

To get more details about nginx configuration, please refer to followings.<br>
http://www.allgoodbits.org/articles/view/29

### How to build
```
$ docker build -t nexhub/nginx .
```
