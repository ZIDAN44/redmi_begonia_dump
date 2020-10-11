#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b0153a3d8eb5c69a35dcb5508f30f2236ef0d9f5; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:e8c49bcb9b2093c03834ad8436b10dae3a5a8646 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:b0153a3d8eb5c69a35dcb5508f30f2236ef0d9f5 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
