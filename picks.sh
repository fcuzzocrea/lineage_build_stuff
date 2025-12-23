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
repopick 439150 # sm8250-common: Update WFD system blobs from dada OS2.0.217.0.WOCMIXM
repopick 458638 # sm8250-common: Disable `thumbnail_block_model` of libstagefright
repopick 460035 # sm8250-common: Opt out of speaker_layout_channel_mask field 

# device/xiaomi/pipa
# repopick 463620 463621 463621 463622 463623 463624 463625 463626 463627 463628 463629 463630 463631 463632 463633 463634 463635 463636 463637 463638 463639 463640 463641 463642 463643 463644 463645 463646 463647 463648 463649 463650 463651 463652 463653 463654 463655 463656 463657 463658 463659 463660 463661 463662 463663 463664 463665 463666 463667

# kernel/xiaomi/sm8250 - kernel with bpf backports not yet pushed
# checkchain kernel/xiaomi/sm8250 refs/changes/83/388683/4

# -------------- PLATFORM STUFF --------------

# bootable/recovery

# build

# frameworks/base
repopick -f 458940 # SystemUI: Implement face unlock recognition animation and text
repopick -f 458941 # SystemUI: Use proper tint for face unlock icon
repopick -f 458942 # SystemUI: Implement bouncer face unlock animation
repopick -f 458943 # SystemUI: Disable FaceUnlock Lockouts
repopick -f 458944 # SenseProvider: Allow our face unlock to be used on third-party apps
repopick -f 458945 # FaceUnlock: Remove background behind indicator on lockscreen
repopick -f 458946 # SystemUI: Add face unlock icon to keyguard blueprint
repopick -f 458947 # base: Initial SenseProvider for FaceSense service
repopick -f 458948 # SystemUI: biometrics: Follow user setting to confirm face unlock
repopick -f 458949 # FaceService: Conditionally add ParanoidSense
repopick -f 458950 # FaceSense: Vibrate on successful authentication
repopick -f 458951 # services: Force load FaceSense providers
repopick -f 458952 # FaceUnlockImageView: Prevent statusBarStateController memory leak
repopick -f 458953 # SystemUI: Fix face unlock indication static calls
repopick -f 458954 # SenseProvider: Align with lineage
repopick -f 458977 # base: Add three-fingers-swipe to screenshot [1/2]
repopick -f 458983 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f 458984 # keystore: Block key attestation for SafetyNet
repopick -f 458985 # AttestationHooks: Set shipping level to 32 for devices >=33
repopick -f 458986 # Limit SafetyNet workarounds to unstable GMS process
repopick -f 458987 # gmscompat: Apply the SafetyNet workaround to Play Store aswell
repopick -f 458988 # gmscompat: Use Nexus 6P fingerprint for CTS/Integrity
repopick -f 458989 # gmscompat: Make CTS/Play Integrity pass again
repopick -f 458990 # gmscompat: Use new info
repopick -f 458991 # gmscompat: Get package name from context instead of app
repopick -f 458992 # gmscompat: Remove unwanted spoofing of DEVICE_INITIAL_SDK_INT
repopick -f 458993 # gmscompat: Allow setting any field in certified build props
repopick -f 458994 # gmscompat: Un-spoof GMS while adding google account
repopick -f 458995 # gmscompat: refacor using switches
repopick -f 458996 # gmscompat: also spoof props for samsung/sec apps

# hardware/samsung_slsi-linaro/config
repopick 464874 # config: wire up BOARD_USES_4K_SWIZZLE_MODE
repopick 453261 # config: Initial configuration for s5e9945
repopick 459043 # BoardConfig9945: rework 9945 configuration

# hardware/samsung_slsi-linaro/exynos
repopick 463125 # exynos: kernel-5.10-headers: Import DRM headers
repopick 463126 # exynos: kernel-6.1-headers: Import DRM headers
repopick 463821 # libexynosgraphicbuffer: sgr: implment get_sajc_sw_mode

# hardware/samsung_slsi-linaro/graphics
repopick 463127 # libhwc2.1: Use kernel headers for DRM modifiers
repopick 463128 # libhwc2.1: Add support for kernel 5.10 SBWC modifier macros
repopick 458446 # libhwc2.1: Add support for kernel 6.1 SBWC modifier macros
repopick 463139 # libhwc2.1: Add support for kernel 6.1 SAJC modifier macros
repopick 463820 # libhwc2.1: add support for 6.1 kernel DRM_FORMAT_MOD_SAMSUNG_SAJC
repopick 462583 # libhwc2.1: platform: Add initial support for s5e9925
repopick 463129 # libhwc2.1: s5e9925: Kill FBInterface modules
repopick 463130 # libhwc2.1: s5e9925: Kill AFBC logic
repopick 464638 # libhwc2.1: s5e9925: Kill Virtual 8K logic
repopick 462586 # libhwc2.1: s5e9925: Kill EPIC interface usage
repopick 463135 # libhwc2.1: s5e9925: drop setPerformanceSetting()
repopick 462585 # libhwc2.1: s5e9925: Brightness / hiber_exit nodes
repopick 464741 # libhwc2.1: s5e9925: Adapt display setup to DRM
repopick 464738 # libhwc2.1: s5e9925: Set stock hardware clocks
repopick 464739 # libhwc2.1: s5e9925: Set stock ppc_table_map
repopick 463137 # libhwc2.1: s5e9925: support TDM based resource allocation
repopick 463305 # libhwc2.1: s5e9925: Align TDM-based resource allocation logic to stock
repopick 459109 # libhwc2.1: s5e9945: Enable WCG/HDR10/HDR10+
# repopick 455766 # Add support for new restrictions property

# hardware/samsung_slsi-linaro/interfaces

# hardware/samsung_slsi-linaro/sgpu
repopick 458397 # Convert gralloc4 service to AIDL
repopick 464872 # sgpu_gralloc: align naming with samsung stock service
repopick 464300 # sgpu_gralloc: add support to 4K swizzle

# hardware/lineage/interfaces

# hardware/samsung

# packages/apps/Launcher3
repopick 456298 # Launcher3: Improve search bar header protection
repopick 456299 # Launcher3: Fixed keyboard disappear on empty search
repopick 456300 # Launcher3: Hide keyboard when transitioning to home screen
repopick 456301 # Launcher3: Improve hidden & protected apps

# packages/apps/Settings
repopick -f 458955 # Add Face Unlock with ParanoidSense
repopick -f 458956 # Settings: Import missing Face Unlock animation
repopick -f 458957 # Settings: Fix crash with face lock preference for limited access users
repopick -f 458958 # FaceEnroll: Fix circle camera view background color
repopick -f 458959 # Settings: Create a ActivityDirector to optionally use SettingsGoogleFutureFaceEnroll
repopick -f 458960 # Settings: Create face confirmation activity
repopick -f 458961 # Settings: Update FaceEnroll ActivityDirector and Confirmation
repopick -f 458962 # Settings: Use ActionPrimaryButton style for face buttons
repopick -f 458978 # Settings: Add three-fingers-swipe to screenshot [2/2]

# packages/apps/SettingsIntelligence

# packages/overlays/Lineage

# vendor/lineage
repopick -f -P vendor/lineage 435923 # lineage: Disable privapp permission enforcement (make it log)
# repopick -f -P vendor/lineage 434170 # adb insecure by default - to be handpicked
repopick -f 458963 # lineage: Switch to AOSPA's face unlock implementation

# Permissive
repopick -f 435920 # SELinux
repopick -f 435921 # root by default
repopick -f 435922 # console root

exit 0
