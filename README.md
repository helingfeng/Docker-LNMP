![demo-portainer.jpg](demo-portainer.jpg)

### 第一步，安装依赖工具

- Git  // brew install git
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

启用服务，第一次需要构建镜像


### 第四步，测试服务访问

http://127.0.0.1/ （可配置强制跳转 https）

https://127.0.0.1/  （由于证书不安全，所以需要点击继续访问）

http://127.0.0.1:9000 （访问 Docker GUI 管理工具）

### `CLI` 运行模式（内置服务）

- 首先，自定义构建 `PHP-CLI` 镜像，安装 `Git`，`Composer`，`Swoole` 等扩展和工具

```shell
# 构建镜像
docker build -t php2-cli ./php-cli/php72
```

- 启动 `Demo` 示例

```shell
# cd your_project_path
cd www/demo

# 运行服务 `demo` 项目
docker run -it --rm --name www-demo \
    -p 8001:8001 \
    -v "$PWD":/usr/workspaces/project \
    -w /usr/workspaces/project \
    php2-cli \
    php -S 0.0.0.0:8001
```

- 启动 `Laravel` 示例

```shell
# cd your_project_path
cd project

# composer install
docker run -it --rm --name www-laravel \
    -v "$PWD":/usr/workspaces/project \
    -w /usr/workspaces/project \
    php2-cli \
    composer install

# php aritsan cache:clear
docker run -it --rm --name www-laravel \
    -v "$PWD":/usr/workspaces/project \
    -w /usr/workspaces/project \
    php2-cli \
    php artisan cache:clear
    
# php artisan serve
docker run -it --rm --name www-laravel \
    -p 8001:8001 \
    -v "$PWD":/usr/workspaces/project \
    -w /usr/workspaces/project \
    php2-cli \
    php artisan serve --host=0.0.0.0 --port=8001
```

- 启动 `Laravel-Swoole` 示例

```
# 配置 host 要修改为 0.0.0.0
# php artisan serve
docker run -it --rm --name www-laravel \
    -p 1215:1215 \
    -v "$PWD":/usr/workspaces/project \
    -w /usr/workspaces/project \
    php2-cli \
    php artisan swoole:http start
```

### Redis 集群配置

编排容器 Redis1-Redis6 使用 redis-cluster.yml 配置文件
```shell
docker-compose -f docker-compose-redis-cluster.yml up -d
```

进入 Redis1 命令行模式，执行创建集群命令
```shell
redis-cli -a CKuTkdUAT_HManA8 --cluster create 175.100.0.61:6381 \
  175.100.0.62:6382 \
  175.100.0.63:6383 \
  175.100.0.64:6384 \
  175.100.0.65:6385 \
  175.100.0.66:6386 \
  --cluster-replicas 1

...
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

使用 Redis-Cli 客户端操作 Redis 集群
```shell
redis-cli -p 6381 -a CKuTkdUAT_HManA8 -c
127.0.0.1:6381> get key
-> Redirected to slot [12539] located at 172.100.0.63:6383
(nil)
172.100.0.63:6383> 
```
