#!/bin/sh

# Wrapper to copy the WSL files to the windows partition for usage with a windows QEMU install
# My focus here is studying OS dev, not making sure this script works for everyone ;)

echo "\n\n###############"
echo "Copying target to Windows partition..."
cp -r target/ /mnt/c/Users/evan/Documents/os

echo "Cleaning file path..."
# When running "cargo xtest" the full path is passed, so remove it
tmp=`echo $@|sed 's/\/home\/evan\/os\/feos\///'`
# Prepend the hardcoded windows file path
tmp=`echo $tmp|sed 's/=target\//=C:\/Users\/evan\/Documents\/os\/target\//'`

echo "###############"
echo "\n(Actually) starting qemu with options \"${tmp}\" ..."
# -drive format=raw,file=C:/Users/evan/Documents/os/target/x86_64-feos/debug/bootimage-feos.bin
/mnt/c/"Program Files"/qemu/qemu-system-x86_64.exe ${tmp}