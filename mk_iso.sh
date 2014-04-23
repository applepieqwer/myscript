rm ex-cd/live/filesystem.squashfs
mksquashfs edit ex-cd/live/filesystem.squashfs
rm ex-cd/md5sum.txt
cd ex-cd
find -type f -print0 |sudo xargs -0 md5sum|grep -v isolinux/boot.cat |sudo tee md5sum.txt
genisoimage -D -r -V 'Applepie-Live' -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../debian-live-7.4-i386-custom.iso .
cd ..
isohybird debian-live-7.4-i386-custom.iso
ncftpput -u applepie -p v79762 192.168.1.105 live-applepie debian-live-7.4-i386-custom.iso

