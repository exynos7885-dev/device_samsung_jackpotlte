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

## Inherit vendor blobs
$(call inherit-product, vendor/samsung/jackpotlte/jackpotlte-vendor.mk)

# Audio
PRODUCT_PACKAGES += \
    libstdc++.vendor

# Camera
PRODUCT_PACKAGES += \
    libgui_vendor

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_SCREEN_HEIGHT := 2220
TARGET_SCREEN_WIDTH := 1080

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.samsung

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/init.baseband.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.baseband.rc \
    $(DEVICE_PATH)/configs/init/init.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.device.rc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    libkeymaster4support

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Shims
PRODUCT_PACKAGES += \
    libcamera_metadata_helper

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.typec

# Wifi
PRODUCT_PACKAGES += \
    WifiOverlayA8
