## 添加部署相关程序

```
git subtree add -P deploy/ git@codeup.aliyun.com:5f10fd25d2481460393375d0/base/deploy/deploy-php.git master

cp deploy/Dockerfile .
cp deploy/docker-entrypoint.sh .
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
docker run -itd --name app -P 80:80 laravel:master
```
