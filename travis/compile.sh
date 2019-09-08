#!/bin/bash
if [[ "$ENABLE_MAINTAINER_ZTS" == 1 ]]; then
	TS="--enable-maintainer-zts";
else
	TS="";
fi
if [[ "$ENABLE_DEBUG" == 1 ]]; then
	DEBUG="--enable-debug --without-pcre-valgrind";
else
	DEBUG="";
fi

if [[ -z "$CONFIG_LOG_FILE" ]]; then
	CONFIG_QUIET="--quiet"
	CONFIG_LOG_FILE="/dev/stdout"
else
	CONFIG_QUIET=""
fi
if [[ -z "$MAKE_LOG_FILE" ]]; then
	MAKE_QUIET="--quiet"
	MAKE_LOG_FILE="/dev/stdout"
else
	MAKE_QUIET=""
fi

MAKE_JOBS=${MAKE_JOBS:-2}

#./buildconf --force
#./configure \
#--prefix="$HOME"/php-install \
#$CONFIG_QUIET \
#$DEBUG \
#$TS \
#--enable-phpdbg \
#--without-pear \
#--enable-exif \
#--without-libzip \
#--enable-sysvsem \
#--enable-sysvshm \
#--enable-shmop \
#--enable-pcntl \
#--enable-sysvmsg \
#--enable-zend-test \
#> "$CONFIG_LOG_FILE"

make "-j${MAKE_JOBS}" $MAKE_QUIET > "$MAKE_LOG_FILE"
#make install >> "$MAKE_LOG_FILE"
