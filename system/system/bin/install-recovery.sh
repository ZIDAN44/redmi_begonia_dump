#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:199cd36306591d9fe7d5856c1f363db1e671e7a9; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:b1f1c211bbab8d0142688cfd54d8206767d5db0c \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:199cd36306591d9fe7d5856c1f363db1e671e7a9 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
