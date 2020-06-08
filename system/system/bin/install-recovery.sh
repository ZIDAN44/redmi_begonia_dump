#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:e7ee3d26392906ec07bb3fe362d3c8374147b461; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:5e062d1d2dfcc02bb21ff047d22441838b1d9345 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:e7ee3d26392906ec07bb3fe362d3c8374147b461 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
