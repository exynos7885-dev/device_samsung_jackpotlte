#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
	vendor/etc/mixer_gains.xml|vendor/etc/mixer_paths.xml)
	    sed -i 's/\/system\/etc\/mixer_gains.xml/\/vendor\/etc\/mixer_gains.xml/g' "${2}"
	    sed -i 's/call_forwarding_master/call_forwarding_primary/g' "${2}"
	    ;;
	vendor/lib/hw/audio.primary.exynos7885.so|vendor/lib/libaudio-ril.so)
	    "${PATCHELF}" --replace-needed libvndsecril-client.so libsecril-client.so "${2}"
	    ;;
	vendor/lib*/hw/camera.exynos7885.so|vendor/lib*/libexynoscamera.so|vendor/lib*/libexynoscamera3.so)
	    "${PATCHELF}" --replace-needed "libcamera_client.so" "libcamera_metadata_helper.so" "${2}"
	    "${PATCHELF}" --replace-needed "libgui.so" "libgui_vendor.so" "${2}"
	    ;;
	vendor/lib/libaudio_soundtrigger.so)
	    "${PATCHELF}" --replace-needed sound_trigger.primary.universal7885.so sound_trigger.primary.exynos7885.so "${2}"
	    ;;
	vendor/lib*/libsensorlistener.so)
	    "${PATCHELF}" --replace-needed "libandroid.so" "libsensorndkbridge.so" "${2}"
	    "${PATCHELF}" --add-needed libshim_sensorndkbridge.so "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=jackpotlte
export DEVICE_COMMON=exynos7885-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
