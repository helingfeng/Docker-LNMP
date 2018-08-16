# 使用 Docker 快速搭建 LNMP 开发环境 

只要你敢尝试一次，就再也不会拒绝它

Docker 使用客户端-服务器 (C/S) 架构模式，使用远程API来管理和创建Docker容器。Docker 容器通过 Docker 镜像来创建。容器与镜像的关系类似于面向对象编程中的对象与类。

![demo-portainer.jpg](demo-portainer.jpg)

### 第一步，安装依赖工具

- Git  // 不懂装，我也没办法
- Docker [https://docs.docker.com/install/]
- Docker-compose [https://docs.docker.com/compose/install/#install-compose]

### 第二步，获取项目代码

```
$ git clone https://github.com/helingfeng/Docker-LNMP.git
```
    
### 第三步，运行容器编排

```
$ cd Docker-LNMP   // 进入项目根目录
$ docker-compose up -d   // 容器编排命令
```

第一次启用服务，需要下载并编译各种工具，请耐心等待一段时间；控制台输出下面信息，表示服务启动完成

```markdown
➜  Docker-LNMP git:(master) ✗ docker-compose up -d
Creating network "docker-lnmp_docker_net" with driver "bridge"
Creating docker-lnmp_portainer_1 ... done
Creating docker-lnmp_redis_1     ... done
Creating docker-lnmp_mysql_1     ... done
Creating docker-lnmp_php72_1     ... done
Creating docker-lnmp_php56_1     ... done
Creating docker-lnmp_nginx_1     ... done
```

### 第四步，测试服务访问

- http://127.0.0.1/ （可配置强制跳转 https）
- https://127.0.0.1/  （由于证书不安全，所以需要点击继续访问）


## 访问 Docker GUI 管理工具

- http://127.0.0.1:9000

## Google 访问（代理翻墙）

- http://127.0.0.1:8080

![google](google.png)

