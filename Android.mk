 LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),c8860)
include $(call all-makefiles-under,$(LOCAL_PATH))
# include $(call all-named-subdir-makefiles, recovery)
    subdir_makefiles := \
        $(LOCAL_PATH)/recovery/rmt_storage/Android.mk \
        $(LOCAL_PATH)/recovery/offmode/Android.mk 

    include $(subdir_makefiles)
endif
