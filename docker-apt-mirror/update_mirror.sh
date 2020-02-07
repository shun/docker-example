#!/bin/bash

RSYNC="rsync --recursive --times --links --hard-links --delete --delete-after"
SOURCE="rsync://ftp.jaist.ac.jp/pub/Linux/ubuntu"
TARGET="/var/spool/apt-mirror/mirror/ftp.jaist.ac.jp/ubuntu"

dists=(xenial bionic)

for dist in "${dists[@]}"; do
  if [ ! -d ${TARGET}/dists/${dist} ]; then
    mkdir -p ${TARGET}/dists/${dist}
  fi
  ${RSYNC} ${SOURCE}/dists/${dist}/ ${TARGET}/dists/${dist}/
done

