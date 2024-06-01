#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 The TWRP Open Source Project
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
DEVICE_PATH := device/samsung/a14x

# Release name
PRODUCT_RELEASE_NAME := a14x

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a14x/device.mk)

- PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, sgdisk)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, cgdisk)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, gdisk)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, fixparts)
+ PRODUCT_COPY_FILES += $(call cc_prebuilt_binary, lz4)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a14x
PRODUCT_NAME := twrp_a14x
PRODUCT_MODEL := SM-A146x
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss
