# Small language pack only
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/c8860/c8860-vendor.mk)

# Overlays
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

PRODUCT_PACKAGES += \
        make-ext4fs \
        lights.msm7x30 \
        DSPManager \
        MusicFX \
        setup_fs 
         	 	
# HAL
PRODUCT_PACKAGES += \
        gralloc.msm7x30 \
        copybit.msm7x30 \
        hwcomposer.msm7x30  

# Graphics
PRODUCT_PACKAGES += \
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
        libdivxdrmdecrypt \
        libOmxVidEnc

# Audio
PRODUCT_PACKAGES += \
        audio.a2dp.default \
        audio.primary.msm7x30 \
        audio_policy.msm7x30 \
        libaudioutils
        
# GPS
PRODUCT_PACKAGES += \
        gps.c8860  

# USB accessory
PRODUCT_PACKAGES += \
        com.android.future.usb.accessory 
         
# Wireless AP
PRODUCT_PACKAGES += \
        hostapd_cli \
        hostapd

# LED
PRODUCT_PACKAGES += \
        Torch \
        Stk 

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# CAMERA HAL (fredvj camera hack)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/camera.msm7630_surf.so:system/lib/hw/camera.msm7x30.so

# BLUETOOTH CONFIG (cm full installs main.conf)(switch to mini-phone in cm.mk will stop it, so you can use original main.conf)
PRODUCT_COPY_FILES += \
        vendor/huawei/c8860/proprietary/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf 
         
# MEDIA PROFILES & BOOT LOGO
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
        $(LOCAL_PATH)/prebuilt/boot-c8860.rle:root/boot-c8860.rle 

# ETC
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
        $(LOCAL_PATH)/prebuilt/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
        $(LOCAL_PATH)/prebuilt/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw         
        
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

# SD card emulation in of emmc partition & Storage
PRODUCT_PROPERTY_OVERRIDES += \
 ro.additionalmounts=/mnt/sdcard \
 ro.vold.switchablepair=/mnt/sdcard,/mnt/sd-ext

# DALVIK
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
 dalvik.vm.heapstartsize=5m \
 dalvik.vm.heapgrowthlimit=48m \
 dalvik.vm.heapsize=128m \
 dalvik.vm.dexopt-data-only = 1 \
 dalvik.vm.dexopt-flags = m = y

# ETC
PRODUCT_PROPERTY_OVERRIDES += \
 persist.fuse_sdcard=true
    
# Include initscripts & configs
$(call inherit-product-if-exists, $(LOCAL_PATH)/initscripts/initscripts.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/configs/android.mk)

# DEVICE USES HIGH DENSITY ARTWORK WHERE AVAILABLE
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# INCLUDE QUALCOMM OPEN SOURCE FEATURES
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)
