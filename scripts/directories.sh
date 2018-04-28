#!/usr/bin/env bash

# directories
export TOP_DIR=`pwd`
export SRC_DIR=/home/alex/Software
export BUILD_DIR="$TOP_DIR/$LONG_NAME"
export PACKAGE_DIR=$TOP_DIR/packages
export LOG_DIR=$BUILD_DIR/logs
export PREREQ_DIR="$TOP_DIR/prereq/$HOST"
export PREREQ_INSTALL="$PREREQ_DIR/install"
export SCRIPTS=$TOP_DIR/scripts
export PREFIX=$BUILD_DIR/$SHORT_NAME

DIRS_TO_MAKE="$BUILD_DIR $LOG_DIR
              $PREFIX $PREFIX/mingw $PREFIX/mingw/include $PREFIX/$TARGET/include $PREFIX/$TARGET/lib
              $PREREQ_INSTALL $PREREQ_INSTALL/lib $PREREQ_INSTALL/include"
mkdir -p $DIRS_TO_MAKE
