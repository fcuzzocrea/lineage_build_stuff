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

# hardware/samsung_slsi-linaro/exynos

# hardware/samsung_slsi-linaro/graphics

# hardware/samsung_slsi-linaro/interfaces

# hardware/lineage/interfaces

# hardware/samsung

# packages/apps/Settings

# packages/apps/SettingsIntelligence
repopick 433482 # Style search bar to match new Settings UI

# packages/overlays/Lineage

# vendor/lineage
repopick -f -p 434168 # lineage: Enable Material Design 3 Expressive
repopick -f -P vendor/lineage 435923 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 434170 # adb insecure by default

exit 0
