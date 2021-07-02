## 添加部署相关程序

```
git subtree add -P deploy/ https://github.com/mouyong/docker-php.git master

cp deploy/fpm/Dockerfile .
cp deploy/acm.sh .
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
