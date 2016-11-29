.PHONY: all  clean 

# Flags
CFLAGS =-g -Wall -fpic
LDFLAGS = -shared

CC?=gcc
CXX?=g++
LD?=gcc

# Directories
LUA_INC_DIR ?= /usr/local/openresty/luajit/include/luajit-2.1/
PROTOBUF_INC_DIR ?=/usr/local/include
# Files
LIB = luapb.so

all:
	
	$(CXX) $(CFLAGS) -c -Iinclude -I$(LUA_INC_DIR) -I$(PROTOBUF_INC_DIR) src/*.cc
	$(CXX) $(LDFLAGS) -o $(LIB) *.o -L/usr/local/lib -L/usr/local/openresty/luajit/lib -lprotobuf  -lluajit-5.1

clean:
	rm -f *.so
	rm -f *.o
