#!/sbin/sh
echo \#!/sbin/sh > /tmp/createnewboot.sh
mkdir /boot
mount /dev/block/mmcblk0p1 /boot
/tmp/unpackbootimg -i /boot/image/boot.img -o /tmp/
echo /tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline \"$(cat /tmp/boot.img-cmdline)\" --base $(cat /tmp/boot.img-base) --pagesize $(printf "%d" 0x`cat /tmp/boot.img-pagesize`) --output /tmp/newboot.img >> /tmp/createnewboot.sh
chmod 777 /tmp/createnewboot.sh
/tmp/createnewboot.sh
cp /tmp/newboot.img /boot/image/boot.img
umount /boot
