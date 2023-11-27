.PHONY: clean test dev release


LUA_PATH := ./src/?.lua


all: release


dev:
	@LUA_PATH="$(LUA_PATH)" du-lua build --copy=development/main

release:
	@LUA_PATH="$(LUA_PATH)" du-lua build --copy=release/main


