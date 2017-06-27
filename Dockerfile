# 选择一个已有的os镜像作为基础
FROM centos:centos6.8

# 镜像的作者
MAINTAINER Ric "596868636@qq.com"

# 安装shopenx源
RUN yum install wget -y \
    && cd /etc/yum.repos.d/ \
    && wget http://mirrors.shopex.cn/shopex/shopex-lnmp/shopex-lnmp.repo \
    && yum install epel-release -y \
    && yum install php-fpm56 ngx_openresty Zend56 -y \
    && yum install crontabs -y \
    && echo 'zend_loader.license_path="/data/httpd/config"' >> /usr/local/php56/etc/php.d/Zend.ini \
    && echo '* * * * *  /data/httpd/script/queue/queue.sh /usr/local/php56/bin/php > /dev/null' >> /var/spool/cron/www \
    && echo '* * * * *  /usr/local/php56/bin/php  /data/httpd/script/crontab/crontab.php >/dev/null' >> /var/spool/cron/www \
    && sed -i "s/\/data\/httpd\/;/\/data\/httpd\/public\/; \n location \/ \n \{ \n autoindex on; \n if \( \!-e \$request_filename \) \{ \n rewrite \^\/\(\.\*\)\$ \/index.php\/\$1 last;\n } \n \}/g" /usr/local/nginx/conf/vhosts/default.conf \
    && chown -R www:www /data/httpd \
    && chkconfig nginx on && chkconfig php-fpm56 on && chkconfig crond on \
    && yum clean all -y
#映射端口
EXPOSE 80 3306 6379
VOLUME ['/data/httpd']
CMD ["/sbin/init"]

# docker run -d -p 80:80 -p 3306:3306 -p 6379:6379 --name bbc -v /Users/ric/git/docker-bbc/app/src/:/data/httpd xierikai/bbcphp56 /sbin/init
# sudo docker build -t xierikai/bbcphp56 .
