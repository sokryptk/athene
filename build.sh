#! /bin/bash

# Variables
AKdir=$PWD/AK/
KernelZip=Arenium-O.zip

# Checks
if [[ ! -e $PWD/builds ]] ; then mkdir $PWD/builds ; fi
if [ -e $PWD/builds/$KernelZip ] ; then rm -rf $PWD/builds/$KernelZip ; fi
if [[ -e $AKdir/zImage ]] ; then rm -rf $AKdir/zImage ; fi
if [[ -e $AKdir/$KernelZip ]] ; then rm -rf $AKdir/$KernelZip ; fi
if [[ ! -e $PWD/builds ]] ; then mkdir $PWD/builds ; fi

# Initiation
make clean && make mrproper
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=$PWD/toolchain/arm-eabi-4.8/bin/arm-eabi-
make arenium_defconfig
make -j4

# Termination
echo " Copying zImage "
cp -rf $PWD/arch/arm/boot/zImage $AKdir
echo " Zip it up Boi! "
cd $AKdir
zip -qr9 $KernelZip *
cd ..
cp -rf $AKdir/$KernelZip $PWD/builds/$KernelZip

# Bye Bye
echo " You should have the kernel zip in the builds folder, Hooray! "
