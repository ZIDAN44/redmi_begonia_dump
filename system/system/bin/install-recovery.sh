#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9d16bacbfd4a3eb2863f2cfdcfd28e6fbbfe69de; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:202b361d0de5b45e3ff5c5e1ecc39b8b3aa0f40b \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:9d16bacbfd4a3eb2863f2cfdcfd28e6fbbfe69de && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
