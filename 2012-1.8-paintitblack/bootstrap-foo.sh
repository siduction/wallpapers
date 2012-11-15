#!/bin/sh
set -e

RELEASE="paintitblack:PaintItBlack-Dev:2012-1.8"

# clean up obsolete stuff
rm -f ./debian/*.install \
    ./debian/*.links \
    ./debian/*.postinst \
    ./debian/*.postrm

#write toplevel Makefile

ALL_CODENAME_SAFE="${ALL_CODENAME_SAFE} $(echo ${RELEASE} | cut -d\: -f1)"

sed -e "s/\@ALL_CODENAME_SAFE\@/${ALL_CODENAME_SAFE}/g" \
    ./debian/templates/Makefile.in \
    > ./Makefile

[ -d ./debian ] || exit 1

TEMPLATE_CHANGELOG="./debian/templates/changelog.in"
sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
    ${TEMPLATE_CHANGELOG} > ./debian/changelog

TEMPLATE_SRC="./debian/templates/control.source.in"
sed     -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
              ${TEMPLATE_SRC} > ./debian/control

# write debian/control from templates
TEMPLATES_BIN="./debian/templates/control.binary.in"

sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
    -e s/\@CODENAME\@/$(echo ${RELEASE} | cut -d\: -f2)/g \
    -e s/\@VERSION\@/$(echo ${RELEASE} | cut -d\: -f3)/g \
    ${TEMPLATES_BIN} >> ./debian/control

# write debian/*.install from templates
for k in kde kdm ksplash wallpaper xfce xsplash; do
    if [ -r  ./debian/templates/siduction-art-${k}-CODENAME_SAFE.install.in ]; then
        sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
            ./debian/templates/siduction-art-${k}-CODENAME_SAFE.install.in \
            > ./debian/siduction-art-${k}-$(echo ${RELEASE} | cut -d\: -f1).install
    else
        continue
    fi
done

# link KDE4 style wallpapers to /usr/share/wallpapers/
sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
    ./debian/templates/siduction-art-wallpaper-CODENAME_SAFE.links.in \
    > ./debian/siduction-art-wallpaper-$(echo ${RELEASE} | cut -d\: -f1).links

## grub theme

sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
    ./debian/templates/grub-theme-siduction-CODENAME_SAFE.install.in \
    > ./debian/grub-theme-siduction-$(echo ${RELEASE} | cut -d\: -f1).install
