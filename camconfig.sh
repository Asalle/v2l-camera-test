#!/bin/sh

export csi2=$(cat /sys/class/video4linux/v4l-subdev*/name | grep "csi2" | head -n 1)
export ip=$(cat /sys/class/video4linux/v4l-subdev*/name | grep "cru-ip" | head -n 1)
export RESOLUTION="2592x1944"

/usr/bin/media-ctl -d /dev/media0 -r
/usr/bin/media-ctl -d /dev/media0 -l "'${csi2}':1 -> '${ip}':0 [1]"
/usr/bin/media-ctl -d /dev/media0 -V "'${csi2}':1 [fmt:UYVY8_2X8/${RESOLUTION} field:none]"
/usr/bin/media-ctl -d /dev/media0 -V "'ov5645 0-003c':0 [fmt:UYVY8_2X8/${RESOLUTION} field:none]"
/usr/bin/media-ctl -d /dev/media0 -V "'${ip}':0 [fmt:UYVY8_2X8/${RESOLUTION} field:none]"
