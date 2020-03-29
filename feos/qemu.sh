echo "Copying target to Windows partition..."
cp -r target/ /mnt/c/Users/evan/Documents/os
echo "Starting qemu..."
/mnt/c/"Program Files"/qemu/qemu-system-x86_64.exe -drive format=raw,file=C:/Users/evan/Documents/os/target/x86_64-feos/debug/bootimage-feos.bin