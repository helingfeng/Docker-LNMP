# Docker 快速搭建 Lnmp 开发环境 

只要你敢尝试一次，就再也不会拒绝它

## 如何使用？

#### 1. 安装工具

- Git
- Docker [https://docs.docker.com/install/]
- Docker-compose [https://docs.docker.com/compose/install/#install-compose]

#### 2. 下载代码

```
$ git clone https://github.com/helingfeng/Docker-LNMP.git
```
    
#### 4. 启动服务

```
$ cd Docker-LNMP
$ docker-compose up -d
```

第一次启用服务，需要下载并编译各种工具，请耐心等待一段时间

![demo](./demo4.png)

表示成功启动服务

#### 5. 访问 Demo

打开浏览器访问:
- http://127.0.0.1/
- https://127.0.0.1/

![demo](./demo3.png)


## 问题与解答 ？

#### 1. `workspace`工作目录映射

```markdown
volumes:
      - ./www/:/var/www/html/:rw
```

将 `./www/` 修改为你的 `workspace` 工作目录，注意 `nginx` `php-fpm` 两个应用都需要修改

#### 2. 多个项目系统，采用虚拟域名，如何相互之间访问

`php-fpm` 应用添加 `extra_hosts` 指向 `nginx` 应用

```markdown
extra_hosts:
      - www.demo1.com:172.100.0.2
```
这里的 `172.100.0.2` 表示 `nginx` 应用`ip`

#### 3. 如何切换`php`版本

`nginx` 配置文件 `.conf` 选项 `fastcgi_pass` 参数定义

```markdown
fastcgi_pass   fpm56:9000;
或者
fastcgi_pass   fpm72:9000;

```