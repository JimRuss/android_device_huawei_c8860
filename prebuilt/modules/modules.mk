 # Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

 # Modules from precompiled kernel (until kernel is built from source)
 modules := \
       ansi_cprng.ko \
       cls_flow.ko \
       cpaccess.ko \
       dal_remotetest.ko \
       dma_test.ko \
       evbug.ko \
       gspca_main.ko \
       librasdioif.ko \
       mtd_erasepart.ko \
       mtd_nandecctest.ko \
       mtd_oobtest.ko \
       mtd_pagetest.ko \
       mtd_readtest.ko \
       mtd_speedtest.ko \
       mtd_stresstest.ko \
       mtd_subpagetest.ko \
       mtd_torturetest.ko \
       qce.ko \
       qcedev.ko \
       qcrypto.ko \
       reset_modem.ko \
       sch_dsmark.ko \
       scsi_wait_scan.ko \
       dhd.ko \
       dhd_4330.ko

 PRODUCT_COPY_FILES += $(foreach file,$(modules),\
       $(LOCAL_PATH)/$(file):system/lib/modules/$(file))
  

