#!/bin/bash
repo init -u https://github.com/LineageOS/android.git -b lineage-17.0
mkdir .repo/local_manifests
mv roomservice.xml .repo/local_manifests/
repo sync -j32
source build/envsetup.sh
export USE_CCACHE=1
ccache -M 50.0G
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx6144m"
export ROOMSERVICE_BRANCHES=lineage-16.0
lunch s2
brunch s2

