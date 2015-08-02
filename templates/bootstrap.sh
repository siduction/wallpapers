#!/bin/sh
set -e

if [ -f ./debian/rules ]; then
    echo "Running debuild clean and  delete the old debian/rules now. "
    echo "Please run bootstrap again!"
    debuild clean
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
rm -f ./debian/*.install ./debian/install \
    ./debian/*.links ./debian/ĺinks \
    ./debian/*.postinst ./debian/postinst \
    ./debian/*.postrm ./debian/postrm  \
    ./debian/*.prerm ./debian/prerm \
    ./debian/*.preinst ./debian/preinst


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



if [ "${FLAVOUR}" = 'cinnamon' ]; then
    cp templates/debian/cinnamon.install  ./debian/install
    cp templates/debian/cinnamon.postinst ./debian/postinst
fi









if [ "${FLAVOUR}" = 'grub-theme' ]; then
    rm -rf template
    cp -a templates/grub-theme/* .
    cp -f templates/grub-theme/Makefile .
    sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
        -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/grub-theme.install \
        > ./debian/install
    sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
        -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/grub-theme.postinst \
        > ./debian/postinst
fi


if [ "${FLAVOUR}" = 'wallpapers' ]; then
    # svg copy
    rm -f ./svg/*.svg
    for i in templates/wallpapers/svg/*.svg; do
        BASENAME=$(basename $i)
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
        -e "s/\@CODENAME\@/${DESCRIPTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        $i \
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
fi




exit 0


# write debian/*.install from templates
for k in kde kdm ksplash lightdm lxde lxqt xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.install ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.install \
            > ./debian/siduction-art-${k}-${NAME}.install
    else
        continue
    fi
done


# write debian/*.postinst from templates
for k in kde kdm ksplash lightdm lxde lxqt xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postinst ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postinst \
            > ./debian/siduction-art-${k}-${NAME}.postinst
    else
        continue
    fi
done


# write debian/*.postrm from templates
for k in kde kdm ksplash lightdm lxde lxqt wallpaper xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postrm ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.postrm \
            > ./debian/siduction-art-${k}-${NAME}.postrm
    else
        continue
    fi
done


# create links
for k in kde kdm ksplash lightdm lxde lxqt wallpaper xfce xsplash; do
    if [ -r  ../templates/debian/siduction-art-${k}-CODENAME_SAFE.links ]; then
        sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
            ../templates/debian/siduction-art-${k}-CODENAME_SAFE.links \
            > ./debian/siduction-art-${k}-${NAME}.links
    else
        continue
    fi
done




sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/artwork/lxqt/theme/lxqt.conf \
    > ./artwork/lxqt/theme/lxqt.conf

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/artwork/splash-kde/description.txt \
    > ./artwork/splash-kde/description.txt

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/artwork/splash-kde/Theme.rc \
    > ./artwork/splash-kde/Theme.rc

sed -e "s/\@CODENAME_SAFE\@/${NAME}/g" \
    ../templates/artwork/splash-xfce/themerc \
    > ./artwork/splash-xfce/themerc


##
## Editable svg's support
##

# Each branch has own background.jpg and elements.svg and those should be added 
# in branch svg dir

# edit *svg.in's from templates and push them to ./artwork/svg
for res in 1024x768 1280x1024 1600x1200 1920x1200 ; do
    sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" ../templates/artwork/svg/kde-splash-$res.svg \
    > ./artwork/svg/kde-splash-$res.svg 
done

sed -e "s/\@CODENAME_SAFE\@/${DISPLAY}/g" ../templates/artwork/svg/xfce-splash-logo.svg \
 > ./artwork/svg/xfce-splash-logo.svg

