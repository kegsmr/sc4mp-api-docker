#!/usr/bin/env sh

if [ ! -n "${VERSION}" ]; then
  VERSION=$(wget -O - https://api.github.com/repos/kegsmr/sc4mp-api/releases/latest | jq -r '.tag_name[1:]')
fi

if [ ! -f "releases/v${VERSION}" ]; then

  rm -r ./releases && mkdir ./releases
  wget -P releases https://github.com/kegsmr/sc4mp-api/archive/refs/tags/v$VERSION.zip
  unzip ./releases/v$VERSION.zip -d ./src

  mv -f ./src/sc4mp-server-$VERSION/* .
  rm -r ./src

fi
