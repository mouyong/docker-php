## 添加部署相关程序

```
git subtree add -P deploy/ https://github.com/mouyong/docker-php.git master

# fpm 镜像构建
cp deploy/fpm/Dockerfile .
# 环境变量
cp deploy/acm.sh .
# 定时任务
cp deploy/crontab .
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
