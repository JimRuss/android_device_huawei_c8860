# Small language pack only
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/c8860/c8860-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/c8860/overlay

# Inherit dalvik parameters
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
# Kernel Modules
$(call inherit-product-if-exists, $(LOCAL_PATH)/prebuilt/modules/modules.mk)
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
PRODUCT_COPY_FILES += \
$(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_PACKAGES += \
        make-ext4fs \
        lights.msm7x30 \
        DSPManager \
        MusicFX \
        setup_fs \
        hwcomposer.default \
	libOmxVidEnc 
	
# Graphics
PRODUCT_PACKAGES += \
        gralloc.msm7x30 \
        copybit.msm7x30 \
        hwcomposer.msm7x30 \
        libgenlock \
        libQcomUI \
        libtilerenderer \
        libmemalloc \
        liboverlay

# QCOM OMX
PRODUCT_PACKAGES += \
        libstagefrighthw \
        libOmxCore \
        libOmxVdec \
        libOmxVenc \
        libmm-omxcore \
        libdivxdrmdecrypt

# Audio
PRODUCT_PACKAGES += \
        audio.a2dp.default \
        audio.primary.msm7x30 \
        audio_policy.msm7x30 \
        libaudioutils

        
# GPS
PRODUCT_PACKAGES += \
        gps.msm7x30 \
        gps.default \
        libgps \
        gps.conf 

# Wireless AP
PRODUCT_PACKAGES += \
        hostapd_cli \
        hostapd

# LED
PRODUCT_PACKAGES += \
        Torch \
        Stk 

# USB
PRODUCT_PACKAGES += \
        com.android.future.usb.accessory

# CAMERA HAL (fredvj camera hack)
PRODUCT_COPY_FILES += \
device/huawei/c8860/prebuilt/camera.msm7630_surf.so:system/lib/hw/camera.msm7x30.so

# BLUETOOTH CONFIG (cm installs main.conf)(switch to mini-phone in cm.mk will stop it)(BCM4329 needs to be set at "DiscoverSchedulerInterval = 0")
PRODUCT_COPY_FILES += \
        vendor/huawei/c8860/proprietary/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf

# VOLD CONFIG & BOOT LOGO & INIT SCRIPTS
PRODUCT_COPY_FILES += \
	device/huawei/c8860/configs/vold.fstab:system/etc/vold.fstab \
	device/huawei/c8860/configs/boot-c8860.rle:root/initlogo.rle \
	device/huawei/c8860/configs/init.huawei.rc:root/init.huawei.rc \
	device/huawei/c8860/configs/init.target.rc:root/init.target.rc \
	device/huawei/c8860/configs/ueventd.huawei.rc:root/ueventd.huawei.rc 
        
# WLAN MODULES
PRODUCT_COPY_FILES += \
	device/huawei/c8860/prebuilt/modules/dhd.ko:system/lib/modules/dhd.ko \
	device/huawei/c8860/prebuilt/modules/dhd_4330.ko:system/lib/modules/dhd_4330.ko \
        vendor/huawei/c8860/proprietary/wifi/nvram.txt:system/wifi/nvram.txt 

# KERNEL MODULES
PRODUCT_COPY_FILES += \
        device/huawei/c8860/prebuilt/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
        device/huawei/c8860/prebuilt/modules/cls_flow.ko:system/lib/modules/cls_flow.ko \
        device/huawei/c8860/prebuilt/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
        device/huawei/c8860/prebuilt/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
        device/huawei/c8860/prebuilt/modules/dma_test.ko:system/lib/modules/dma_test.ko \
        device/huawei/c8860/prebuilt/modules/evbug.ko:system/lib/modules/evbug.ko \
        device/huawei/c8860/prebuilt/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
        device/huawei/c8860/prebuilt/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
        device/huawei/c8860/prebuilt/modules/mtd_erasepart.ko:system/lib/modules/mtd_erasepart.ko \
        device/huawei/c8860/prebuilt/modules/mtd_nandecctest.ko:system/lib/modules/mtd_nandecctest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_oobtest.ko:system/lib/modules/mtd_oobtest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_pagetest.ko:system/lib/modules/mtd_pagetest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_readtest.ko:system/lib/modules/mtd_readtest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_speedtest.ko:system/lib/modules/mtd_speedtest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_stresstest.ko:system/lib/modules/mtd_stresstest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_subpagetest.ko:system/lib/modules/mtd_subpagetest.ko \
        device/huawei/c8860/prebuilt/modules/mtd_torturetest.ko:system/lib/modules/mtd_torturetest.ko \
        device/huawei/c8860/prebuilt/modules/qce.ko:system/lib/modules/qce.ko \
        device/huawei/c8860/prebuilt/modules/qcedev.ko:system/lib/modules/qcedev.ko \
        device/huawei/c8860/prebuilt/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
        device/huawei/c8860/prebuilt/modules/reset_modem.ko:system/lib/modules/reset_modem.ko \
        device/huawei/c8860/prebuilt/modules/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
        device/huawei/c8860/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

# ETC
PRODUCT_COPY_FILES += \
        device/huawei/c8860/prebuilt/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
        device/huawei/c8860/prebuilt/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
        device/huawei/c8860/prebuilt/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
        device/huawei/c8860/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
        vendor/huawei/c8860/data/cdrom/autorun.iso:system/cdrom/autorun.iso

# PERMISSIONS

PRODUCT_COPY_FILES += \
frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.telephony.cdma.xml \
frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
frameworks/base/data/etc/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml \
packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_c8860
PRODUCT_DEVICE := c8860
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := c8860
PRODUCT_MANUFACTURER := Huawei

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Include Qualcomm open source features
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)
