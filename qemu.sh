#!/bin/sh

sudo qemu-system-mips -M malta -kernel ~/vmlinux-2.6.32-5-4kc-malta -hda ~/debian_squeeze_mips_standard.qcow2 -append "root=/dev/sda1 console=tty0" -net nic,macaddr=00:16:3e:00:00:01 -net tap
