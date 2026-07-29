#
# Copyright (C) 2023-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Common
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

## Device
$(call inherit-product, device/samsung/jackpotlte/device.mk)

## LineageOS
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier
PRODUCT_NAME := lineage_jackpotlte
PRODUCT_DEVICE := jackpotlte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy A8 2018
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung
PRODUCT_SHIPPING_API_LEVEL := 28
