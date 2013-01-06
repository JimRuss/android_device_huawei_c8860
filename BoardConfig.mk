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

# HEADER (target path)
TARGET_SPECIFIC_HEADER_PATH += device/huawei/c8860/include

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/huawei/c8860/BoardConfigVendor.mk

# BOOTLOADER
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# HUAWEI c8860 PLATFORM
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOOTLOADER_BOARD_NAME := c8860
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT := armv7-a-neon
QCOM_TARGET_PRODUCT := msm7x30
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
TARGET_HAVE_ION := true

# KERNEL (TARGET) 
TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := device/huawei/c8860/prebuilt/kernel

# KERNEL (KERNEL BASE INFLATES)(CHANGE SIZE TO = PHYS_OFFSET= 0x00200000)  
BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=huawei androidboot.emmc=true
BOARD_INSTALLER_CMDLINE := $(BOARD_KERNEL_CMDLINE) 
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

# TARGET CFLAGS
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# COMMON CFLAGS
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DTARGET7x30 -DTARGET_MSM7x30 -DREFRESH_RATE=60 

# CAMERA & AUDIO
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := true

# GRAPHICS (OPENGL HARDWARE ACCLERATION)
TARGET_HARDWARE_3D := false
USE_OPENGL_RENDERER := true
BOARD_USES_ADRENO_200 := true
HAVE_ADRENO200_SOURCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_HAVE_BYPASS := false
TARGET_QCOM_HDMI_OUT := true
TARGET_QCOM_HDMI_RESOLUTION_AUTO := true
TARGET_GRALLOC_USES_ASHMEM := true
#if (TARGET_GRALLOC_USES_ASHMEM) is enabled, set debug.sf.hw=1 in system.prop
TARGET_USES_OVERLAY := true
TARGET_USES_GENLOCK := true
BOARD_USES_HWCOMPOSER := true
BOARD_USES_QCNE := true
BOARD_USES_MMCUTILS := true
ENABLE_WEBGL := true
TARGET_USES_SF_BYPASS := false
WEBCORE_INPAGE_VIDEO := true
TARGET_HAVE_TSLIB := true
TARGET_FORCE_CPU_UPLOAD := true

# QUALCOMM HARDWARE
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true 
BOARD_USE_QCOM_PMEM := true

# SCORPION OPTIMIZATION
#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
	 
# FM RADIO
BOARD_FM_DEVICE := bcm4330
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# BLUETOOTH
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# CUSTOM RELEASETOOLS FOR OLD PARTITION TABLE
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOLS_OTA_FROM_TARGET_SCRIPT := device/huawei/c8860/releasetools/ota_from_target_files

# WLAN 
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_ARG := ""
WIFI_DRIVER_FW_PATH_STA := "/system/wifi/firmware.bin /system/wifi/fw_4330_b2_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/wifi/firmware_apsta.bin /system/wifi/fw_4330_b2_ap.bin"
WIFI_DRIVER_FW_PATH_P2P := "p2p"

# GPS 
BOARD_VENDOR_QCOM_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x30
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# FILESYSTEM 
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_MMC_DEVICE := /dev/block/mmcblk0
BOARD_DATA_DEVICE := /dev/block/mmcblk0p13
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p12 # mmcblk0p14 (use internal as sys)
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p6
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p14 # mmcblk1p1 (internal as sdext)
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p1 #(mmcblk1p2 misc)

# PARTITIONS
# Fix this up by examining fdisk /dev/block/mmcblk0 on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000 #10MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000 #10MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456 #256MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824 #1GB
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880 #5MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728 #128MB
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 4096000 #4000KB
BOARD_FLASH_BLOCK_SIZE := 262144 #(BOARD_KERNEL_PAGESIZE * 64)

# RECOVERY
BOARD_NO_RGBX_8888 := true
TARGET_NO_RECOVERY := false
BOARD_RECOVERY_CHARGEMODE := true
BOARD_RECOVERY_RMT_STORAGE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
TARGET_RECOVERY_INITRC := device/huawei/c8860/recovery/recovery.rc
BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/c8860/recovery/graphics.c
BOARD_RECOVERY_DEFINES := BOARD_HAS_NO_SELECT_BUTTON BOARD_HAS_SMALL_RECOVERY BOARD_UMS_LUNFILE BOARD_USE_CUSTOM_RECOVERY_FONT #BOARD_RECOVERY_HANDLES_MOUNT BOARD_RECOVERY_ALWAYS_WIPES 

# DISPLAY
DEVICE_RESOLUTION := 480x854

# TOUCHSCREEN
BOARD_USE_LEGACY_TOUCHSCREEN := true

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true 
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

#ETC
BOARD_ALWAYS_INSECURE := true
TARGET_COMPRESS_MODULE_SYMBOLS := false

