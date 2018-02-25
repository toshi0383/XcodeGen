#!/bin/bash
TOOL_NAME=XcodeGen
TOOL_NAME_LOWER=xcodegen
TMP=$(mktemp -d)/$TOOL_NAME
BINDIR=$TMP/bin
SHAREDIR=$TMP/share
ZIPFILE=$TMP/$TOOL_NAME_LOWER.zip
INSTALLSH=scripts/install-binary.sh

mkdir -p $BINDIR
cp -f .build/release/$TOOL_NAME_LOWER $BINDIR

mkdir -p $SHAREDIR
cp -R SettingPresets $SHAREDIR/SettingPresets

sed -e 's/^BASE_DIR=.*/BASE_DIR=$(cd `dirname $0`; pwd)/' $INSTALLSH \
    > $TMP/install.sh
chmod +x $TMP/install.sh

(cd $TMP/..; zip -r $ZIPFILE $TOOL_NAME)
mv $ZIPFILE .

rm -rf $TMP
