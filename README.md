## 简介

可以批量部署的的 docker php 版本环境，方便你放入 k8s 或者通过服务器的 docker 进行部署。

数据库、文件存储和 redis 缓存采用外部服务提供。允许容器无服务化快速扩容，缩容。


## 添加部署相关程序

```
git subtree add -P deploy/docker/ https://github.com/mouyong/docker-php.git master

# fpm 镜像构建
cp deploy/docker/fpm/Dockerfile .
# 环境变量
cp deploy/docker/acm.sh .
# 定时任务
cp deploy/docker/crontab .
```

## 构建镜像

```
docker build -t laravel .
```

## 检查构建出来的镜像

```
docker image ls
```

## 启动镜像

```
docker run -itd --name app -P 80:80 laravel:latest
```
