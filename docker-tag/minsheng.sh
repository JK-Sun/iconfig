#!/bin/bash

# 远端镜像仓库地址
remote_repository="registry.cn-hangzhou.aliyuncs.com/gitee-prod"

original_image="$1"

os="linux/amd64"

bash ./base.sh $original_image $remote_repository $os

