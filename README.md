# 使用`Docker`快速搭建`LNMP`开发环境 

只要你敢尝试一次，就再也不会拒绝它

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

第一次启用服务，需要下载并编译各种工具，请耐心等待一段时间；出现下面截图信息，表示服务启动完成

![demo](./demo5.png)



### 第四步，测试服务访问

- http://127.0.0.1/ （强制跳转 https）
- https://127.0.0.1/  （由于证书不安全，所以需要点击继续访问）

![demo](./demo3.png)


## 更多使用说明

[查看文档](wiki.md)