#!/bin/bash

current="$(pwd)"
mkdir -p packages

bash install_luajit.sh

cd packages

wget https://github.com/openresty/lua-nginx-module/archive/v0.10.10.zip
unzip v0.10.10.zip

wget https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.zip
unzip v0.3.0.zip

wget https://nginx.org/download/nginx-1.12.1.tar.gz
tar -xvf nginx-1.12.1.tar.gz

cd nginx-1.12.1

export LUAJIT_LIB=$current/LuaJIT/lib
export LUAJIT_INC=$current/LuaJIT/include/luajit-2.0

./configure \
  --with-ld-opt="-Wl,-rpath,$current/LuaJIT/lib" \
  --add-module="$current/packages/ngx_devel_kit-0.3.0" \
  --add-module="$current/packages/lua-nginx-module-0.10.10" \
  --prefix="$current/nginx/"

make
make install

echo -e "\n*******************************************************************************"
echo "Downloading nginx lua redis to $current, include this path in nchan config"
echo -e "*******************************************************************************\n"
cd ../
wget https://github.com/openresty/lua-resty-redis/archive/v0.26.zip
unzip v0.26.zip
mv lua-resty-redis-0.26 ../
