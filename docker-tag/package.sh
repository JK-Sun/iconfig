
#!/bin/bash

# 脚本使用方式：
# $1: docker镜像地址
# $2: 架构（linux/amd64 or linux/arm64v8）
# ./docker.sh docker-hub.gitee.work/gitee-prod/code-gitaly:v14.16.1-minsheng-v3.2.0 linux/amd64

original_image="$1"

os="$2"

docker pull --platform $os $original_image

# 提取镜像仓库和标签
tag=$(echo $original_image | awk -F ':' '{print $2}' | sed 's/-minsheng//g')
prod=$(echo $original_image | awk -F ':' '{print $1}' | awk -F '/' '{print $3}')
package_name="$prod-$tag.tar.gz"

echo "包名称：$package_name"

# 打包镜像
docker save $original_image | gzip > $package_name

# 删除本地镜像
docker rmi  -f $original_image

