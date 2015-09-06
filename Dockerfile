FROM centos:7

MAINTAINER Sungho Moon <sungho.moon@navercorp.com>

# Nginx with LDAP Authentication module.

ENV NGINX_VERSION 1.9.4
ENV NGINX_USER nginx

RUN yum update -y
RUN yum groupinstall "Development Tools" -y
RUN yum install openssl-devel pcre-devel openldap-devel wget -y

# add user
RUN useradd -s /bin/false nginx

# Get nginx source
WORKDIR /root/
RUN wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
RUN tar xvf nginx-${NGINX_VERSION}.tar.gz

# Get nginx ldap module
RUN wget https://github.com/kvspb/nginx-auth-ldap/archive/master.zip
RUN unzip master.zip

# Install nginx
WORKDIR /root/nginx-${NGINX_VERSION}
RUN ./configure \
    --user=${NGINX_USER} \
    --group=${NGINX_USER} \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/run/nginx.lock \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-http_gzip_static_module \
    --with-http_stub_status_module \
    --with-http_ssl_module \
    --with-pcre \
    --with-file-aio \
    --with-http_realip_module \
    --add-module=..//nginx-auth-ldap-master/ \
    --with-ipv6 \
    --with-debug

RUN make && make install

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ADD nginx.conf /etc/nginx/nginx.conf

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
