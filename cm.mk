# First, set the baseband technology
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := c8860

# Inherit some common cyanogenmod stuff.(cm full installs main.conf)(switch to mini-phone in cm.mk will stop it)(QC's bt chip needs 1; but now BCM4329 needs 0)"DiscoverSchedulerInterval = 0"
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/c8860/full_c8860.mk)

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x854

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := c8860
PRODUCT_NAME := cm_c8860
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Mercury
PRODUCT_MANUFACTURER := Huawei

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
        PRODUCT_NAME=c8860 \
        BUILD_DISPLAY_ID="IMM76L" \
        BUILD_FINGERPRINT=Huawei/c8860:4.0.4/IMM76L/124115:userdebug/test-keys \
        PRIVATE_BUILD_DESC="Huawei-user 4.0.4 IMM76L 124115 test-keys" \
        BUILD_NUMBER=124115


