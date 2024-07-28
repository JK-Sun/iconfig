#!/bin/bash

# 脚本使用方式：
# $1: docker镜像地址
# $2: 要推送到的仓库镜像地址
# $3: 架构（linux/amd64 or linux/arm64v8）
# ./docker.sh docker-hub.gitee.work/gitee-prod/code-gitaly:v14.16.1-minsheng-v3.2.0 registry.cn-hangzhou.aliyuncs.com/gitee-prod linux/amd64

original_image="$1"

# 远端镜像仓库地址
remote_repository="$2"

os="$3"

docker pull --platform $os $original_image

# 提取镜像仓库和标签
tag=$(echo $original_image | awk -F ':' '{print $2}' | sed 's/-minsheng//g')
prod=$(echo $original_image | awk -F ':' '{print $1}' | awk -F '/' '{print $3}')
new_image="$remote_repository/$prod:$tag"

echo "源镜像地址：$original_image"
echo "新镜像地址：$new_image"
echo "镜像架构：$os"

echo "你确定要推送到远端 Docker 仓库中吗？(y/n)"
# 判断用户输入
read confirmation
if [ "$confirmation" != "y" ]; then
    echo "取消操作"
    exit 1
fi

# 推送镜像
docker tag $original_image $new_image
docker push $new_image

# 删除本地镜像
docker rmi  -f $original_image $new_image

