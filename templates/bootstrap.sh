#!/bin/sh
set -e

if [ -f ./debian/rules ]; then
    echo "You would run debuild clean first and delete the old debian/rules... "
    exit 1
fi

if [ -f VERSION ]; then
    . ./VERSION
else
    echo "No VERSION-File, exit!"
    exit 1
fi

# clean up obsolete stuff
rm -f ./debian/*.install \
    ./debian/*.links \
    ./debian/*.postinst \
    ./debian/*.postrm

#write toplevel Makefile

ALL_CODENAME_SAFE="${ALL_CODENAME_SAFE} ${NAME}"

sed -e "s/\@ALL_CODENAME_SAFE\@/${ALL_CODENAME_SAFE}/g" \
    ../templates/Makefile.in \
    > ./Makefile

[ -d ./debian ] || exit 1

TEMPLATE_CHANGELOG="../templates/debian/changelog.in"
if [ ! -e ./debian/changelog ]; then
    sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
        ${TEMPLATE_CHANGELOG} \
        > ./debian/changelog
fi

TEMPLATE_SRC="../templates/debian/control.source.in"
sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ${TEMPLATE_SRC} \
    > ./debian/control

# write debian/control from templates
TEMPLATES_BIN="../templates/debian/control.binary.in"

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
    -e "s/\@VERSION\@/${VERSION}/g" \
    ${TEMPLATES_BIN} \
    >> ./debian/control

# debian/rules
sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/debian/rules.in \
    > ./debian/rules
chmod 755 ./debian/rules

# debian/source/options
sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/debian/source/options.in \
    > ./debian/source/options


# write debian/*.install from templates
for k in kde kdm ksplash lightdm lxde lxqt lxqt-qt5 rqt wallpaper xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.install.in ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.install.in \
            > ./debian/siduction-art-${k}-${NAME}.install
    else
        continue
    fi
done


# write debian/*.postinst from templates
for k in kde kdm ksplash lightdm lxde lxqt lxqt-qt5 rqt wallpaper xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postinst.in ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postinst.in \
            > ./debian/siduction-art-${k}-${NAME}.postinst
    else
        continue
    fi
done


# write debian/*.postrm from templates
for k in kde kdm ksplash lightdm lxde lxqt lxqt-qt5 rqt wallpaper xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postrm.in ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postrm.in \
            > ./debian/siduction-art-${k}-${NAME}.postrm
    else
        continue
    fi
done


# create links
for k in kde kdm ksplash lightdm lxde lxqt lxqt-qt5 rqt wallpaper xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.links.in ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.links.in \
            > ./debian/siduction-art-${k}-${NAME}.links
    else
        continue
    fi
done

## grub theme
sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/debian/grub-theme-siduction-CODENAME_SAFE.install.in \
    > ./debian/grub-theme-siduction-${NAME}.install

## create Artwork files
sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/dm-kdm/CODENAME_SAFE.xml.in \
    > ./artwork/dm-kdm/${DISPLAY}.xml

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/dm-kdm/KdmGreeterTheme.desktop.in \
    > ./artwork/dm-kdm/KdmGreeterTheme.desktop

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/lxqt/lxqt.conf.in \
    > ./artwork/lxqt/theme/lxqt.conf

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/lxqt-qt5/lxqt.conf.in \
        > ./artwork/lxqt-qt5/theme/lxqt.conf

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/rqt/razor.conf.in \
    > ./artwork/rqt/theme/razor/razor.conf

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/splash-kde/description.txt.in \
    > ./artwork/splash-kde/description.txt

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/splash-kde/Theme.rc.in \
    > ./artwork/splash-kde/Theme.rc

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/splash-xfce/themerc.in \
    > ./artwork/splash-xfce/themerc

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" \
    ../templates/artwork/wallpaper/metadata.desktop.in \
    > ./artwork/wallpaper/metadata.desktop

##
## Editable svg's support
##

# Each branch has own background.jpg and elements.svg and those should be added 
# in branch svg dir

# Copy svg from templates under ./artwork/svg
for files in *.svg ;do
    cp -af ../templates/artwork/svg/$files ./artwork/svg
done

# edit *svg.in's from templates and push them to ./artwork/svg
for res in 1024x768 1280x1024 1600x1200 1920x1200 ; do
    sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" ../templates/artwork/svg/kde-splash-$res.svg.in \
    > ./artwork/svg/kde-splash-$res.svg 
done

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" ../templates/artwork/svg/kdm-footer.svg.in \
    > ./artwork/svg/kdm-footer.svg

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" ../templates/artwork/svg/xfce-splash-logo.svg.in \
 > ./artwork/svg/xfce-splash-logo.svg

for size in 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200 ; do
    sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" ../templates/artwork/svg/wall-$size.svg.in \
    > ./artwork/svg/wall-$size.svg
done
