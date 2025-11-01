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
repopick 458940 # SystemUI: Implement face unlock recognition animation and text
repopick 458941 # SystemUI: Use proper tint for face unlock icon
repopick 458942 # SystemUI: Implement bouncer face unlock animation
repopick 458943 # SystemUI: Disable FaceUnlock Lockouts
repopick 458944 # SenseProvider: Allow our face unlock to be used on third-party apps
repopick 458945 # FaceUnlock: Remove background behind indicator on lockscreen
repopick 458946 # SystemUI: Add face unlock icon to keyguard blueprint
repopick 458947 # base: Initial SenseProvider for FaceSense service
repopick 458948 # SystemUI: biometrics: Follow user setting to confirm face unlock
repopick 458949 # FaceService: Conditionally add ParanoidSense
repopick 458950 # FaceSense: Vibrate on successful authentication
repopick 458951 # services: Force load FaceSense providers
repopick 458952 # FaceUnlockImageView: Prevent statusBarStateController memory leak
repopick 458953 # SystemUI: Fix face unlock indication static calls
repopick 458954 # SenseProvider: Align with lineage
repopick 458977 # base: Add three-fingers-swipe to screenshot [1/2]
repopick 458983 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick 458984 # keystore: Block key attestation for SafetyNet
repopick 458985 # AttestationHooks: Set shipping level to 32 for devices >=33
repopick 458986 # Limit SafetyNet workarounds to unstable GMS process
repopick 458987 # gmscompat: Apply the SafetyNet workaround to Play Store aswell
repopick 458988 # gmscompat: Use Nexus 6P fingerprint for CTS/Integrity
repopick 458989 # gmscompat: Make CTS/Play Integrity pass again
repopick 458990 # gmscompat: Use new info
repopick 458991 # gmscompat: Get package name from context instead of app
repopick 458992 # gmscompat: Remove unwanted spoofing of DEVICE_INITIAL_SDK_INT
repopick 458993 # gmscompat: Allow setting any field in certified build props
repopick 458994 # gmscompat: Un-spoof GMS while adding google account
repopick 458995 # gmscompat: refacor using switches
repopick 458996 # gmscompat: also spoof props for samsung/sec apps

# hardware/samsung_slsi-linaro/configs
repopick 453260 # config: Check kernel version properly for openmax
repopick 453261 # config: Initial configuration for s5e9945
repopick 459041 # fixup! config: add openmax compatibility makefile
repopick 459042 # openmax: wire up more configurables
repopick 459043 # BoardConfig9945: rework 9945 configuration

# hardware/samsung_slsi-linaro/exynos
repopick 459044 # exynos: Add kernel-6.1-headers

# hardware/samsung_slsi-linaro/graphics
# repopick 455766 # Add support for new restrictions property
repopick 453273 # libhwc2.1: s5e9945: Adapt CpuPerfInfo to s5e9945
repopick 453275 # libhwc2.1: s5e9945: Enable WCG/HDR10/HDR10+
repopick 458446 # Set SBWC alignment

# hardware/samsung_slsi-linaro/interfaces

# hardware/samsung_slsi-linaro/sgpu
repopick 458397 # Convert gralloc4 service to AIDL

# hardware/lineage/interfaces

# hardware/samsung

# packages/apps/Launcher3
repopick 456298 # Launcher3: Improve search bar header protection
repopick 456299 # Launcher3: Fixed keyboard disappear on empty search
repopick 456300 # Launcher3: Hide keyboard when transitioning to home screen
repopick 456301 # Launcher3: Improve hidden & protected apps

# packages/apps/Settings
repopick 458955 # Add Face Unlock with ParanoidSense
repopick 458956 # Settings: Import missing Face Unlock animation
repopick 458957 # Settings: Fix crash with face lock preference for limited access users
repopick 458958 # FaceEnroll: Fix circle camera view background color
repopick 458959 # Settings: Create a ActivityDirector to optionally use SettingsGoogleFutureFaceEnroll
repopick 458960 # Settings: Create face confirmation activity
repopick 458961 # Settings: Update FaceEnroll ActivityDirector and Confirmation
repopick 458962 # Settings: Use ActionPrimaryButton style for face buttons
repopick 458978 # Settings: Add three-fingers-swipe to screenshot [2/2]

# packages/apps/SettingsIntelligence
repopick 433482 # Style search bar to match new Settings UI
repopick 452780 # Wip: Style search bar for 16

# packages/overlays/Lineage

# vendor/lineage
repopick -f -P vendor/lineage 435923 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 434170 # adb insecure by default
repopick 458963 # lineage: Switch to AOSPA's face unlock implementation

# Permissive
repopick -f 435920 # SELinux
repopick -f 435921 # root by default
repopick -f 435922 # console root

exit 0
