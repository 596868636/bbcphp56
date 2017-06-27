# bbcphp56
商派bbc程序 php5.6版本 docker环境 dockerfile配置文件
容器下载：docker pull xierikai/bbcphp56
直接使用：

docker run -d -p 80:80 -p 3306:3306 -p 6379:6379 -v 源码目录:/data/httpd xierikai/bbcphp56 /sbin/init

例：docker run -d -p 80:80 -p 3306:3306 -p 6379:6379 -v /Users/ric/git/docker-bbc/app/src/:/data/httpd xierikai/bbcphp56 /sbin/init

该系统用于单机开发环境，目前容器中集成php-fpm56、nginx、 mysql 、 redis、crontabs
当然，目前该容器有点小大，后续会添加集群环境的docker进行分解。

镜像地址：docker pull registry.cn-shenzhen.aliyuncs.com/onex/b2b2c  可直接拉取
