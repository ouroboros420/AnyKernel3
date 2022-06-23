# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Nethunter Kernel by JochenSplifficus @ Telegram
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=crownlte
device.name2=crownltexx
device.name3=starlte
device.name4=starltexx
device.name5=star2lte
device.name6=star2ltexx
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/platform/11120000.ufs/by-name/BOOT;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;

# Find device image/device tree
device_name=$(file_getprop /default.prop ro.product.device);
mv -f $home/kernel/$device_name/Image $home/Image;
mv -f $home/kernel/$device_name/dtb.img $split_img/extra;

write_boot;
## end install
