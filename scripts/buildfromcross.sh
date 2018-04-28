#!/usr/bin/env bash

# common settings
echo "Executing preliminary setup"
# build settings
. ./scripts/settings.sh || exit 1
# version info
echo "-> Loading version info"
. ./scripts/versions.sh || exit 1
# set up and create directories
echo "-> Setting up directories"
. ./scripts/directories.sh || exit 1

export GNU_WIN32_OPTIONS="--disable-win32-registry --disable-rpath --disable-werror"

# Projects to be built, in the right order
PREGCC_STEPS="mingw-w64-headers
              binutils
              mingw-w64-crt"
POSTGCC_STEPS="gdb
               make"
cd $BUILD_DIR
mkdir -p $PREGCC_STEPS
mkdir -p gcc
mkdir -p $POSTGCC_STEPS

# Build
for step in $PREGCC_STEPS
do
  cd $BUILD_DIR/$step
  echo "-> $step"
  . $SCRIPTS/$step.sh || exit 1
done

# build GCC
cd $BUILD_DIR/gcc
echo "-> GCC: Full compiler suite"
. $SCRIPTS/gcc.sh || exit 1

# build the rest
for step in $POSTGCC_STEPS
do
  cd $BUILD_DIR/$step
  echo "-> $step"
  . $SCRIPTS/$step.sh || exit 1
done
