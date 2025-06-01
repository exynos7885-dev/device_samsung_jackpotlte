#
# Copyright (C) 2023-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## Device Path
DEVICE_PATH := device/samsung/jackpotlte

## Include common BoardConfig
include device/samsung/exynos7885-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG := lineage_jackpotlte_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 262144000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4160749568

# Vintf
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
