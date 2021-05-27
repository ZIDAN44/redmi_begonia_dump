#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:509d3f5561a36e1d9dd6c12f1f749082634dfef8; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:953e786111b990e81664118e5019d04c42e6f618 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:509d3f5561a36e1d9dd6c12f1f749082634dfef8 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
