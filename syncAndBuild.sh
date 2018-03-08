#!/usr/bin/env bash
cd /root/android-x86
#repo sync --no-tags --no-clone-bundle
source build/envsetup.sh
make -j6 iso_img TARGET_PRODUCT=android_x86_64 TARGET_KERNEL_CONFIG=hi10Nougat.config

