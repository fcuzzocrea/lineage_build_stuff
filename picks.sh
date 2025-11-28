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
repopick 459968 # openmax: Wire up ST2094 properly
repopick 459984 # openmax: Rename filmgrain configurable
repopick 460013 # hwc: Enable USE_LIBHDR*_PLUGIN when BOARD_LIBHDR*_PLUGIN is set
repopick 460012 # gralloc: Add configurable for SGR Gralloc
repopick 460014 # config: Add configurable for legacy libgdc option
repopick 460011 # hwc: Rename configurable for SAJC
repopick 460048 # config: Add configurable for sbwcwrapper priority
repopick 453261 # config: Initial configuration for s5e9945
repopick 459043 # BoardConfig9945: rework 9945 configuration
repopick 458636 # config: Initial configuration for s5e9925
repopick 462372 # config: add configurable for libhdr_header_version

# hardware/samsung_slsi-linaro/exynos
repopick 459044 # exynos: Add kernel-6.1-headers
repopick 459102 # libhdr-common-headers: export platform independent headers
repopick 459210 # libhdr-common-header: provide struct hdrCoef
repopick 459138 # libdisplaycolor: define log tag 

# hardware/samsung_slsi-linaro/graphics
# repopick 455766 # Add support for new restrictions property
repopick 459108 # libhwc2.1: s5e9945: Adapt CpuPerfInfo to s5e9945
repopick 459109 # libhwc2.1: s5e9945: Enable WCG/HDR10/HDR10+
repopick 458446 # Set SBWC alignment
repopick 459110 # libacryl: make the libhdrinterface headers configurable

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
repopick 433482 # Style search bar to match new Settings UI

# packages/overlays/Lineage

# vendor/lineage
repopick -f -P vendor/lineage 435923 # lineage: Disable privapp permission enforcement (make it log)
repopick -f -P vendor/lineage 434170 # adb insecure by default
repopick -f 458963 # lineage: Switch to AOSPA's face unlock implementation

# Permissive
repopick -f 435920 # SELinux
repopick -f 435921 # root by default
repopick -f 435922 # console root

exit 0
