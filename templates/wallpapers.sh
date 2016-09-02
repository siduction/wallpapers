#!/bin/sh
set -e

if [ -f ./debian/rules ]; then
    echo "Running debuild clean and  delete the old debian/rules now. "
    echo "Please run bootstrap again!"
    [ -f ./debian/changelog ] && debuild -d clean
    rm -f debian/rules
    exit 1
fi

if [ -f VERSION ]; then
    . ./VERSION
else
    echo "No VERSION-File, exit!"
    exit 1
fi

if [ -f FLAVOUR ]; then
    . ./FLAVOUR
else
    echo "No FLAVOUR-File, exit!"
    exit 1
fi

# clean up obsolete stuff
rm -f ./debian/install \
      ./debian/ĺinks \
      ./debian/postinst \
      ./debian/postrm  \
      ./debian/prerm \
      ./debian/preinst


[ -d ./debian ] || exit 1


if [ ! -e ./debian/changelog ]; then
    sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
        -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/changelog \
        > ./debian/changelog
fi

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/${FLAVOUR}-control \
    > ./debian/control

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/rules \
    > ./debian/rules
chmod 755 ./debian/rules

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/source/options \
    > ./debian/source/options


rm -f svg/*.svg
for i in templates/wallpapers/svg/*.svg; do
    BASENAME=$(basename $i)
    sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
        -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" $i \
        > ./svg/${BASENAME}
done

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/wallpapers.install \
    > ./debian/install

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/wallpapers.links \
    > ./debian/links

cp templates/wallpapers/Makefile .
sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/wallpapers/metadata.desktop \
    > ./metadata.desktop
