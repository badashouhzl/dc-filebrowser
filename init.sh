#!/bin/bash

# 工作路径
g_workPath=$(cd `dirname \$0`; pwd -P)
cd $g_workPath 

. $g_workPath/func.sh



# 创建网络
echo "----- create network ------"
mkNetworkPublic "net-public"
mkNetworkPrivate "net-private"

# 创建卷
echo "----- create volume ------"
mkVolume "vol-filebrowser"


setEnv "path" "$g_workPath" .env
set "uid" "`id -u`" .env
set "gid" "`id -g`" .env