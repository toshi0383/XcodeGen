#!/bin/bash
PREFIX=${1:-/usr/local}
ZIPFILE=xcodegen.zip
if [ ! -f $ZIPFILE ];then
    echo $ZIPFILE not found
    exit 1
fi
unzip -o xcodegen.zip

BASE_DIR=XcodeGen

cp -r $BASE_DIR/share "${PREFIX}"
cp -r $BASE_DIR/bin "${PREFIX}"
