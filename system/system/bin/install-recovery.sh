#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:980eb4218b509846099266fd4d425ebb35760213; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:75c88620e7ceeeace093997a36413ba0172e0ed2 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:980eb4218b509846099266fd4d425ebb35760213 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
