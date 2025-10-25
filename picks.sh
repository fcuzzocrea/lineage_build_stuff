#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

function checkchain() {
  git -C $1 fetch github $2
  git -C $1 checkout FETCH_HEAD
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/samsung_slsi/sepolicy
# repopick 357508 # sepolicy: add policy for super fast charge

# device/lineage/sepolicy
# repopick 357348 # sepolicy: add policy for super fast charge

# device/xiaomi/sm8250-common

# device/xiaomi/pipa
# repopick 376507 376508 376509 376510 376513 376519 376520 376524 376525 376527 376529 376530 388725 398051 399010

# kernel/xiaomi/sm8250
# checkchain kernel/xiaomi/sm8250 refs/changes/83/388683/4

# -------------- PLATFORM STUFF --------------

# bootable/recovery

# build

# frameworks/base

# hardware/samsung_slsi-linaro/configs
repopick 453260 # config: Check kernel version properly for openmax
repopick 453261 # config: Initial configuration for s5e9945

# hardware/samsung_slsi-linaro/exynos

# hardware/samsung_slsi-linaro/graphics
repopick 455766 # Add support for new restrictions property
repopick 453273 # libhwc2.1: s5e9945: Adapt CpuPerfInfo to s5e9945
repopick 453275 # libhwc2.1: s5e9945: Enable WCG/HDR10/HDR10+

# hardware/samsung_slsi-linaro/interfaces

# hardware/lineage/interfaces

# hardware/samsung

# packages/apps/Launcher3
repopick -p 456301 # improvements

# packages/apps/Settings

# packages/apps/SettingsIntelligence
repopick 452780 # Wip: Style search bar for 16

# packages/overlays/Lineage

# vendor/lineage
repopick -f -P vendor/lineage 435923 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 434170 # adb insecure by default
repopick -f -P vendor/lineage 434168 # lineage: Enable Material Design 3 Expressive

# Permissive
repopick -f 435920 # SELinux
repopick -f 435921 # root by default
repopick -f 435922 # console root

exit 0
