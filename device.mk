#
# Copyright (C) 2023-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := samsungexynos7885

## Device Path
DEVICE_PATH := device/samsung/jackpotlte

## Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

## Inherit common device
$(call inherit-product, device/samsung/exynos7885-common/exynos7885.mk)

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_SCREEN_HEIGHT := 2220
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
