#! /bin/bash

# A script for setting up environment for travis-ci testing.
# Sets up Lua and Luarocks.

set -eufo pipefail
source .travis/platform.sh

LUA_HOME_DIR=$TRAVIS_BUILD_DIR/install/lua
LR_HOME_DIR=$TRAVIS_BUILD_DIR/install/luarocks

mkdir $HOME/.lua
mkdir -p "$LUA_HOME_DIR"

curl http://www.lua.org/ftp/lua-5.3.2.tar.gz | tar xz
cd lua-5.3.2;

# Build Lua without backwards compatibility for testing
perl -i -pe 's/-DLUA_COMPAT_(ALL|5_2)//' src/Makefile
make $PLATFORM
make INSTALL_TOP="$LUA_HOME_DIR" install;

ln -s $LUA_HOME_DIR/bin/lua $HOME/.lua/lua
ln -s $LUA_HOME_DIR/bin/luac $HOME/.lua/luac;

cd $TRAVIS_BUILD_DIR
lua -v
LUAROCKS_BASE=luarocks-2.3.0
curl --location http://luarocks.org/releases/$LUAROCKS_BASE.tar.gz | tar xz

cd $LUAROCKS_BASE
./configure --with-lua="$LUA_HOME_DIR" --prefix="$LR_HOME_DIR"
make build && make install
ln -s $LR_HOME_DIR/bin/luarocks $HOME/.lua/luarocks

cd $TRAVIS_BUILD_DIR
luarocks --version
rm -rf $LUAROCKS_BASE lua-5.3.2;
