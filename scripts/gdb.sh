#!/usr/bin/env bash

if [ -f configure.marker ]
then
  echo "--> Already configured"
else
  echo "--> Configuring"
  sh $SRC_DIR/gdb/configure --host=$HOST --build=$BUILD --target=$TARGET --prefix=$PREFIX \
                            --disable-nls --disable-python --disable-multilib --enable-64-bit-bfd \
                            CFLAGS="$HOST_CFLAGS" LDFLAGS="$HOST_LDFLAGS -static" \
                            > $LOG_DIR/gdb_configure.log 2>&1 || exit 1
  echo "--> Configured"
fi
touch configure.marker

if [ -f build.marker ]
then
  echo "--> Already built"
else
  echo "--> Building"
  make $MAKE_OPTS > $LOG_DIR/gdb_build.log 2>&1 || exit 1
fi
touch build.marker

if [ -f install.marker ]
then
  echo "--> Already installed"
else
  echo "--> Installing"
  make $MAKE_OPTS install > $LOG_DIR/gdb_install.log 2>&1 || 
exit 1
fi
touch install.marker
