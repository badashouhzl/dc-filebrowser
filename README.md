[TOC]
# 说明
网盘工具部署
- [参考官网](https://filebrowser.org/)
- [github](https://github.com/filebrowser/filebrowser)
- [dockerhub](https://hub.docker.com/r/filebrowser/filebrowser/tags)




# 部署步骤
## 使用端口转发
这种是没有限止容器内部网络，没有依赖反向代理，可以单运行
1. 先确认并修改 .env 配置文件
	- image: 镜像版本可以不修改，也可以使用更新的版本 [dockerhub](https://hub.docker.com/r/filebrowser/filebrowser/tags)
	- network: 网桥类型，使用 net-public
	- port: 转发端口(宿主机端口)，要以不修改默认 5245，或找一个没有使用的
	- 其它不用修改，init.sh 脚本会修改
1. 由于使用的是 有网络的网桥，所以还要修改一下 docker-compose.yaml
	- 删除 ipv4_address 所在的一行
1. 执行启动命令   
	```shell
	docker compose up -d
	```
1. 执行命令，命令查看管理员用户密码
	```shell
	docker compose logs 
	```
	会输出下面内容:	里面就是用户名和密码
	> Generated random **`admin`** password for quick setup: **`HiGU1KxK_cI1`**
1. 到此已经完成部署了，在浏览器里访问就可以了

## 使用无网络环境的 nginx 转发
1. 先确认并修改 .env 配置文件
	- image: 镜像版本可以不修改，也可以使用更新的版本 [dockerhub](https://hub.docker.com/r/filebrowser/filebrowser/tags)
	- network: 网桥类型，使用 net-private(不用修改默认就是)
	- port: 转发端口(宿主机端口)，不用修改，在这个网络环境下，这个配置没有用
	- 其它不用修改，init.sh 脚本会修改
1. 由于使用的是 有网络的网桥，所以还要修改一下 docker-compose.yaml
	- 删除 ipv4_address 所在的一行
1. 执行启动命令   
	```shell
	docker compose up -d
	```
1. 执行命令，命令查看管理员用户密码
	```shell
	docker compose logs 
	```
	会输出下面内容:	里面就是用户名和密码
	> Generated random **`admin`** password for quick setup: **`HiGU1KxK_cI1`**
1. filebrowser 部署已经完成，接下来是 nginx 配置了
	1. 请根据 filebrowser.nginx.conf 文件的注释
	1. 将 filebrowser.nginx.conf放到 nginx 配置目录下(需要 nginx 配置 include 的目录)