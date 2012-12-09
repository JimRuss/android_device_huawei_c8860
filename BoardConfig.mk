# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

# COMMON CFLAGS
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DTARGET7x30
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x30
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 
COMMON_GLOBAL_CFLAGS += -DMISSING_GRALOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD 
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12 
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE 

# HEADER (target path)
TARGET_SPECIFIC_HEADER_PATH += device/huawei/c8860/include

# CAMERA & AUDIO
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := true 

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/huawei/c8860/BoardConfigVendor.mk

#BOOTLOADER
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := c8860
TARGET_OTA_ASSERT_DEVICE :=msm7630_surf,hwc8860,c8860,C8860,M886

# HUAWEI c8860 PLATFORM
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT := armv7-a-neon
QCOM_TARGET_PRODUCT := msm7x30
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_ARMV7A_BUG := true

# KERNEL (BUILD FROM SOURCE)(HAVE TO EDIT device_c8860.mk)*=create
#BUILD_KERNEL := true
#TARGET_CROSS_COMPILE := arm-eabi-  
#TARGET_KERNEL_SOURCE := kernel/huawei/c8860(not sure about path)
#TARGET_KERNEL_CONFIG := cm9_c8860_defconfig
#KERNEL_EXTERNAL_MODULES := $(LOCAL_PATH)/prebuilt/modules/ *(modules.mk)
#TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES
TARGET_PREBUILT_KERNEL := device/huawei/c8860/prebuilt/kernel
#TARGET_KERNEL_CUSTOM_TOOLCHAIN:= $(SRC_PATH)/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin(maybe able to shorten to "arm-eabi-4.4.3")

# KERNEL (KERNEL BASE INFLATES)(CHANGE SIZE TO = PHYS_OFFSET= 0x00200000)  
BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=huawei androidboot.emmc=true 
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

#TARGET CFLAGS
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# GRAPHICS (OPENGL HARDWARE ACCLERATION)
TARGET_HARDWARE_3D := false
USE_OPENGL_RENDERER := true
BOARD_USES_ADRENO_200 := true
#TARGET_USES_C2D_COMPOSITION := true
TARGET_HAVE_BYPASS := false
TARGET_QCOM_HDMI_OUT := true
TARGET_QCOM_HDMI_RESOLUTION_AUTO := true
TARGET_GRALLOC_USES_ASHMEM := true
#if (TARGET_GRALLOC_USES_ASHMEM) is enabled, set debug.sf.hw=1 in system.prop
#TARGET_USES_OVERLAY := true
TARGET_USES_GENLOCK := true
TARGET_FORCE_CPU_UPLOAD := true
BOARD_USES_HWCOMPOSER := true
BOARD_USES_QCNE := true
BOARD_USES_MMCUTILS := true
ENABLE_WEBGL := true
TARGET_USES_SF_BYPASS := false
WEBCORE_INPAGE_VIDEO := true
#TARGET_HAVE_TSLIB := true
#TARGET_HAVE_ION := true

# QUALCOMM HARDWARE
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true 
BOARD_USE_QCOM_PMEM := true
#BOARD_USE_QCOM_SPEECH := true
#BOARD_HAS_QCOM_WLAN := true

# SCORPION OPTIMIZATION
#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true	 

# FM RADIO
#BOARD_FM_DEVICE := bcm4330
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

#BLUETOOTH
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_DOWNLOAD_MODE := true

# CUSTOM RELEASETOOLS FOR OLD PARTITION TABLE
TARGET_RELEASETOOLS_OTA_FROM_TARGET_SCRIPT := device/huawei/c8860/releasetools/ota_from_target_files
#TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/huawei/c8860/releasetools/img_from_target_files

# WLAN 
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_FW_PATH_STA := "/system/wifi/firmware.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/wifi/firmware_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "p2p"

# GPS 
BOARD_VENDOR_QCOM_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x30
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# FILESYSTEM 
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_DATA_DEVICE := /dev/block/mmcblk0p13
BOARD_DATA_FILESYSTEM := ext4
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p12
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p6
BOARD_CACHE_FILESYSTEM := ext4 
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p14
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p1
#BOARD_HAS_NO_MISC_PARTITION := true

# PARTITIONS
# Fix this up by examining fdisk /dev/block/mmcblk0 on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 545259520
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1447034880
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_FLASH_BLOCK_SIZE := 4096

# RECOVERY
TARGET_RECOVERY_INITRC := device/huawei/c8860/recovery/recovery.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/c8860/recovery/graphics.c
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/huawei/c8660/recovery/c8860_recovery_ui.c

# DISPLAY
DEVICE_RESOLUTION := 480x854

# TOUCHSCREEN
BOARD_USE_LEGACY_TOUCHSCREEN := true
BOARD_HAS_NO_SELECT_BUTTON := true

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true 
BOARD_USES_USB_GADGET := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"


