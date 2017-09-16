## Using lua in nginx

### Installation

`clone repo`

`bash install_nginx.sh`

Above command will install [LuaJIT](http://luajit.org/) and Nginx(with Lua) in current directory.

Make sure that all dependencies of Nginx are installed, a [test installation of Nginx](https://www.nginx.com/resources/admin-guide/installing-nginx-open-source/) can be done to test it.

Once the script finishes, 4 folders will be created in current directory

1) `LuaJIT`
   - LuaJIT will be installed in this path
2) `lua-resty-redis-0.26`
    - Lus module for redis.
    - This path will be included in the nginx config also.
3) `nginx`
    - nginx installation directory
4) `packages`
    - Contains all packages downloaded during installation.

### Running Nginx

`sudo ./nginx/sbin/nginx`

This starts nginx with its default configuration.

Refer [nginx.conf](nginx.conf) and make the required changes in the config file `./nginx/conf/nginx.conf`

### Using with redis

refer [nginx.conf](nginx.conf) for detailed comments

redis-cli: `SET qazxswe "/assets/a/interlaced/IPHONE5.ts"`

\> `curl http://localhost/query/qazxswe` 
will output `/assets/a/interlaced/IPHONE5.ts`
