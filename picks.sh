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

# device/lineage/sepolicy

# device/xiaomi/sm8250-common

# device/xiaomi/pipa

# kernel/xiaomi/sm8250 - kernel with bpf backports not yet pushed

# -------------- PLATFORM STUFF --------------

# bootable/recovery

# build

# frameworks/base
repopick -f 476077 # base: Initial SenseProvider for FaceSense service
repopick -f 476078 # FaceService: Conditionally add ParanoidSense
repopick -f 476079 # FaceSense: Vibrate on successful authentication
repopick -f 476080 # services: Force load FaceSense providers
repopick -f 476081 # SystemUI: Disable FaceUnlock Lockouts
repopick -f 476082 # SystemUI: biometrics: Follow user setting to confirm face unlock
repopick -f 476083 # KeyguardBouncer: Don't delay showing if face auth running
repopick -f 476084 # SystemUI: Implement face unlock recognition text
repopick -f 476085 # SystemUI: Implement the newly reverse-engineered smartspace
repopick -f 476086 # SystemUI: Disable smartspace default view

# hardware/samsung_slsi-linaro/config
# repopick -f 464874 # config: wire up BOARD_USES_4K_SWIZZLE_MODE
# repopick -f 453261 # config: Initial configuration for s5e9945
# repopick -f 459043 # BoardConfig9945: rework 9945 configuration

# hardware/samsung_slsi-linaro/exynos
# repopick 463125 # exynos: kernel-5.10-headers: Import DRM headers
# repopick 463126 # exynos: kernel-6.1-headers: Import DRM headers
# repopick 463821 # libexynosgraphicbuffer: sgr: implment get_sajc_sw_mode

# hardware/samsung_slsi-linaro/graphics
# repopick 463820 # libhwc2.1: add support for 6.1 kernel DRM_FORMAT_MOD_SAMSUNG_SAJC
# repopick 459109 # libhwc2.1: s5e9945: Enable WCG/HDR10/HDR10+
# repopick 455766 # Add support for new restrictions property

# hardware/samsung_slsi-linaro/interfaces

# hardware/samsung_slsi-linaro/sgpu
# repopick 458397 # Convert gralloc4 service to AIDL
# repopick 464300 # sgpu_gralloc: add support to 4K swizzle

# hardware/lineage/interfaces

# hardware/samsung

# packages/apps/Launcher3
repopick 480649 # Launcher3: Add pause/unpause app system shortcut
repopick 478624 # Enable navbar animation by default
repopick -f 487244 # Launcher3: Copy 4x5 grid size from Pixel
repopick -f 487245 # Launcher3: Restore 4x4 workspace
repopick -f 487246 # Launcher3: Update grid sizes from Pixel launcher
repopick -f 487247 # Launcher3: Ditch workspace top/bottom padding for 6*5 grid

# packages/apps/Settings
repopick -f 476087 # Add Face Unlock with ParanoidSense
repopick -f 476088 # Settings: Long press to copy wifi password

# packages/apps/SettingsIntelligence

# packages/overlays/Lineage

# vendor/lineage
repopick -f 476089 # lineage: Switch to AOSPA's face unlock implementation

# For bringup
# repopick -f -P vendor/lineage 467627 # lineage: Disable privapp permission enforcement (make it log)
# repopick -f -P vendor/lineage 434170 # adb insecure by default - to be handpicked
# repopick -f 435920 # SELinux
# repopick -f 435921 # root by default
# repopick -f 435922 # console root

exit 0
