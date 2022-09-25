#!/usr/bin/env bash
set -euo pipefail

firmware=dztech_dz60rgb_ansi_v2_1_sfxr.bin
dest=/run/media/simon/KBDFANS/FLASH.BIN

die() { echo "error: $*" >&2; exit 1; }

[[ -r $firmware ]] || die "$firmware does not exist"
[[ -w $dest ]] || die "$dest not writeable"

dd if="$firmware" of="$dest" bs=512 conv=notrunc oflag=direct,sync
