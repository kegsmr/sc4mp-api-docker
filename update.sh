#!/usr/bin/env sh

if [ ! -n "${VERSION}" ]; then
  VERSION=$(wget -O - https://api.github.com/repos/kegsmr/sc4mp-api/releases/latest | jq -r '.tag_name')
fi

if [ ! -f "releases/${VERSION}" ]; then

  rm -r ./releases && mkdir ./releases
  wget -P releases https://github.com/kegsmr/sc4mp-api/archive/refs/tags/$VERSION.zip
  unzip ./releases/$VERSION.zip -d ./src

  mv -f ./src/sc4mp-api-$VERSION/* .
  rm -r ./src

fi
