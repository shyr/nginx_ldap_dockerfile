# nginx_ldap_dockerfile
Dockerizing nginx with LDAP module based on `centos:7`.
This is because that [the basic nginx of official docker image](https://github.com/nginxinc/docker-nginx) does not support LDAP module. This image include [nginx-auth-ldap module](https://github.com/kvspb/nginx-auth-ldap). 


### To more details about nginx configuration, please refer to followings.<br>
http://www.allgoodbits.org/articles/view/29
