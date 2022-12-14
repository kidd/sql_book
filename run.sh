#!/usr/bin/env bash

set -x
main() {
  cd /files/ || exit 1
  rm -fr /files/localpath
  mkdir -p /files/localpath
  cp -- */* localpath
  unlink /localpath ; ln -s "$PWD/localpath/" /localpath
  local creates=(./localpath/create_*)
  psql -h db -p 5432 -U sqluser sqluser ${creates[@]/#/-f }
}

main "$@"
