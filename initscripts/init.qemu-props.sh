#!/system/bin/sh

# call 'qemu-props' to set system properties from the emulator.
#
/system/bin/qemu-props

# this line doesn't really do anything useful. however without it the
# previous setprop doesn't seem to apply for some really odd reason
setprop ro.qemu.init.completed 1
