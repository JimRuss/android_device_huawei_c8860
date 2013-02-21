# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := c8860

# Inherit some common cyanogenMod stuff.(cm full installs main.conf)(switch to mini-phone in cm.mk will stop it)(QC's bt chip needs 1; but now BCM4329 needs 0)"DiscoverSchedulerInterval = 0"
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


