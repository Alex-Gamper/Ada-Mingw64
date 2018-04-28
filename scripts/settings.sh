#!/usr/bin/env bash

# build options - for my system only, change if you want/need
export BUILD="x86_64-linux-gnu"
export MAKE_OPTS=""

export HOST_CFLAGS="-O2"
export HOST_CXXFLAGS="$HOST_CFLAGS"
export HOST_LDFLAGS="$HOST_LDFLAGS"

export TARGET_CFLAGS="-O2"
export TARGET_CXXFLAGS="$TARGET_CFLAGS"
export TARGET_LDFLAGS="$TARGET_LDFLAGS"

# GCC languages to be built
export GCC_LANGUAGES='c,c++,ada'
