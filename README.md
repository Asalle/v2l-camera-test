# v2l-camera-test
test scripts to stress-test camera of RZ/V2L

## Prerequisites

```
sudo apt install v4l-utils gstreamer1.0-tools gstreamer1.0-plugins-good gstreamer1.0-plugins-bad
```

On Ubuntu image please start weston from the virtual terminal:
```
weston
```

Please use the following values for WAYLAND_DISPLAY:
```
# On Yocto
WAYLAND_DISPLAY=wayland-0 ./test.sh 2

# On Ubuntu
WAYLAND_DISPLAY=wayland-1 ./test.sh 2
```

The difference is caused by the fact that weston is running as a systemd service in yocto with default DISPLAY `wayland-0`, whereas on Ubuntu we are quired to start the weston by hand.
