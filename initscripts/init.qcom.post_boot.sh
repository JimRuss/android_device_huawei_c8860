#!/system/bin/sh
# Copyright (c) 2012, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following
# disclaimer in the documentation and/or other materials provided
# with the distribution.
# * Neither the name of Code Aurora Forum, Inc. nor the names of its
# contributors may be used to endorse or promote products derived
# from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

# Modified for c8860 from original "init.qcom.post_boot.sh"

    echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo 90 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/up_threshold
    chown system /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
    
    echo 75000 > /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
    echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

    emmc_boot=`getprop ro.emmc`
    case "$emmc_boot"
       in "1")
           chown system /sys/devices/platform/rs300000a7.65536/force_sync
           chown system /sys/devices/platform/rs300000a7.65536/sync_sts
           chown system /sys/devices/platform/rs300100a7.65536/force_sync
           chown system /sys/devices/platform/rs300100a7.65536/sync_sts
     ;;
 esac
