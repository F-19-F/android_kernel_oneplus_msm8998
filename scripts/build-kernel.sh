#!/bin/bash
# mkdir ~/clang_14_0_6
# wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/a71fa4c09d7109d611ee63964fc9fca58fee38cd/clang-r450784d.tar.gz -O ~/clang_14_0_6/clang-r450784d.tar.gz
# tar -xvzf ~/clang_14_0_6/clang-r450784d.tar.gz  -C ~/clang_14_0_6
export clangpath=${HOME}/clang_14_0_6/bin
# git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 -b android-10.0.0_r32 ~/arm-linux-androideabi-4.9 --depth 1
export gccpath=${HOME}/arm-linux-androideabi-4.9/bin
export gcc64path=${HOME}/aarch64-linux-android-4.9/bin
PATH=${clangpath}:${gcc64path}:$PATH
args="-j$(nproc --all) \
O=out \
ARCH=arm64 \
CC=clang \
LLVM=1 \
LLVM_IAS=1 \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=aarch64-linux-android- \
CROSS_COMPILE_ARM32=${gccpath}/arm-linux-androideabi-"
make ${args} lineage_oneplus5_defconfig
make ${args}