# Overview

This image is based on debian:11-slim. It creates a container with tools(clang, gcc, make, etc) needed to build linux kernel.

A volume containing kernel source code (v5.15) will be created when creating a container. It will be mounted on `/home/workspace`. `/home/workspace/linux` is linux src directory, with a `compile_commands.json` under it, which can be used by LSP (like clangd) for intellisense.