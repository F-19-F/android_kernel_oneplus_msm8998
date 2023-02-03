
#!/bin/bash
cp /home/f19/op5_lineage20/out/arch/arm64/boot/Image.gz /home/f19/UPDATE-AnyKernel3
cd /home/f19/UPDATE-AnyKernel3 || exit
zip -r9 UPDATE-AnyKernel3.zip ./* -x .git .gitignore ./*.zip
adb.exe push ./UPDATE-AnyKernel3.zip /sdcard
adb.exe reboot recovery