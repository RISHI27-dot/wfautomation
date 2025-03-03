#!/bin/bash

echo $(dd if=~/spare/ti-linux-kernel/build/arch/arm64/boot/Image.gz bs=1 skip=$(LC_ALL=C grep -a -b -o $'\x1f\x8b\x08\x00\x00\x00\x00\x00' ~/ti-linux-kernel/build/arch/arm64/boot/Image.gz | head -n 1 | cut -d ':' -f 1) | zcat | grep -a 'Linux version' | grep -a -oP 'Linux version \K[\w.-]+' | head -n1)

