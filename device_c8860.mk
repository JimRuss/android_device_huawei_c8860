# Small language pack only
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/c8860/c8860-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

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
        libgps 
         

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
$(LOCAL_PATH)/prebuilt/camera.msm7630_surf.so:system/lib/hw/camera.msm7x30.so

# BLUETOOTH CONFIG (cm installs main.conf)(switch to mini-phone in cm.mk will stop it)(BCM4329 needs to be set at "DiscoverSchedulerInterval = 0")
PRODUCT_COPY_FILES += \
        vendor/huawei/c8860/proprietary/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf 
         
# MEDIA PROFILES & BOOT LOGO
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
        $(LOCAL_PATH)/prebuilt/boot-c8860.rle:root/boot-c8860.rle 
          
# WLAN MODULES
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/modules/dhd.ko:system/lib/modules/dhd.ko \
	$(LOCAL_PATH)/prebuilt/modules/dhd_4330.ko:system/lib/modules/dhd_4330.ko \
        vendor/huawei/c8860/proprietary/wifi/nvram.txt:system/wifi/nvram.txt 

# KERNEL MODULES
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
        $(LOCAL_PATH)/prebuilt/modules/cls_flow.ko:system/lib/modules/cls_flow.ko \
        $(LOCAL_PATH)/prebuilt/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
        $(LOCAL_PATH)/prebuilt/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
        $(LOCAL_PATH)/prebuilt/modules/dma_test.ko:system/lib/modules/dma_test.ko \
        $(LOCAL_PATH)/prebuilt/modules/evbug.ko:system/lib/modules/evbug.ko \
        $(LOCAL_PATH)/prebuilt/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
        $(LOCAL_PATH)/prebuilt/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_erasepart.ko:system/lib/modules/mtd_erasepart.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_nandecctest.ko:system/lib/modules/mtd_nandecctest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_oobtest.ko:system/lib/modules/mtd_oobtest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_pagetest.ko:system/lib/modules/mtd_pagetest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_readtest.ko:system/lib/modules/mtd_readtest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_speedtest.ko:system/lib/modules/mtd_speedtest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_stresstest.ko:system/lib/modules/mtd_stresstest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_subpagetest.ko:system/lib/modules/mtd_subpagetest.ko \
        $(LOCAL_PATH)/prebuilt/modules/mtd_torturetest.ko:system/lib/modules/mtd_torturetest.ko \
        $(LOCAL_PATH)/prebuilt/modules/qce.ko:system/lib/modules/qce.ko \
        $(LOCAL_PATH)/prebuilt/modules/qcedev.ko:system/lib/modules/qcedev.ko \
        $(LOCAL_PATH)/prebuilt/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
        $(LOCAL_PATH)/prebuilt/modules/reset_modem.ko:system/lib/modules/reset_modem.ko \
        $(LOCAL_PATH)/prebuilt/modules/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
        $(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

# ETC
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
        $(LOCAL_PATH)/prebuilt/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
        $(LOCAL_PATH)/prebuilt/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
        vendor/huawei/c8860/data/cdrom/autorun.iso:system/cdrom/autorun.iso 
        
# PERMISSIONS(HARDWARE SPECIFIC) 

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

PRODUCT_PROPERTY_OVERRIDES += \
ro.additionalmounts=/mnt/emmc \
ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc

# Include initscripts & configs
$(call inherit-product-if-exists, $(LOCAL_PATH)/initscripts/initscripts.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/configs/android.mk)

# DEVICE USES HIGH DENSITY ARTWORK WHERE AVAILABLE
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# WE HAVE ENOUGH SPACE TO HOLD PRECISE GC DATA
PRODUCT_TAGS += dalvik.gc.type-precise

# INCLUDE QUALCOMM OPEN SOURCE FEATURES
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)
