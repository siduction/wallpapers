#!/bin/sh
set -e

RELEASE="ridersonthestorm:Riders-On-The-Storm:12-2.0"

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
if [ ! -e ./debian/changelog ]; then 
sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
    ${TEMPLATE_CHANGELOG} > ./debian/changelog
fi

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
for k in kde kdm ksplash lightdm rqt wallpaper xfce xsplash; do
    if [ -r  ./debian/templates/siduction-art-${k}-CODENAME_SAFE.install.in ]; then
        sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
            ./debian/templates/siduction-art-${k}-CODENAME_SAFE.install.in \
            > ./debian/siduction-art-${k}-$(echo ${RELEASE} | cut -d\: -f1).install
    else
        continue
    fi
done

# write debian/*.postinst from templates
for k in kde kdm ksplash lightdm rqt wallpaper xfce xsplash; do
    if [ -r  ./debian/templates/siduction-art-${k}-CODENAME_SAFE.postinst.in ]; then
        sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
            ./debian/templates/siduction-art-${k}-CODENAME_SAFE.postinst.in \
            > ./debian/siduction-art-${k}-$(echo ${RELEASE} | cut -d\: -f1).postinst
    else
        continue
    fi
done

# write debian/*.postrn from templates
for k in kde kdm ksplash rqt wallpaper xfce xsplash; do
    if [ -r  ./debian/templates/siduction-art-${k}-CODENAME_SAFE.postrm.in ]; then
        sed -e s/\@CODENAME_SAFE\@/$(echo ${RELEASE} | cut -d\: -f1)/g \
            ./debian/templates/siduction-art-${k}-CODENAME_SAFE.postrm.in \
            > ./debian/siduction-art-${k}-$(echo ${RELEASE} | cut -d\: -f1).postrm
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
