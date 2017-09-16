#!/bin/bash
#http://luajit.org/install.html

install_path="$(pwd)/LuaJIT"
mkdir -p packages
cd packages
wget http://luajit.org/download/LuaJIT-2.0.5.zip
unzip LuaJIT-2.0.5.zip
cd LuaJIT-2.0.5
make PREFIX=$install_path
make install PREFIX=$install_path
