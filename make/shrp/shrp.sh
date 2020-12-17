# !/bin/bash
##########################################################################
#Copyright 2019 SKYHAWK RECOVERY PROJECT
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
##########################################################################

# Get current working dir
#
dir="$(pwd)"
#
# Run shrp env variables from here
#
SHRP_BUILD_DIR=out/shrp
SHRP_MAINTAINER=$(sed -n '1p' "$(pwd)/${SHRP_BUILD_DIR}/variables")
SHRP_DEVICE=$(sed -n '2p' "$(pwd)/${SHRP_BUILD_DIR}/variables")
SHRP_REC=$(sed -n '3p' "$(pwd)/${SHRP_BUILD_DIR}/variables")

cat > "${dir}"/${SHRP_BUILD_DIR}/shrp_vital <<EOF
ro.shrp.recovery.block=$SHRP_REC
EOF

cat > "${dir}"/${SHRP_BUILD_DIR}/updater-script <<EOF
show_progress(1.000000, 0);
ui_print("             ");
ui_print("Skyhawk Recovery Project                  ");
ui_print("|SHRP version - 2.2 Stable                ");
ui_print("|Device - $SHRP_DEVICE");
ui_print("|Maintainer - $SHRP_MAINTAINER");
delete_recursive("/sdcard/SHRP");
package_extract_dir("Files", "/sdcard/");
set_progress(0.500000);
package_extract_file("recovery.img", "$SHRP_REC");
set_progress(0.700000);
ui_print("                                                  ");
ui_print("Contact Us,");
ui_print(" + Website- http://shrp.cf                        ");
ui_print(" + Telegram Group - t.me/sky_hawk                 ");
ui_print(" + Telegram Channel - t.me/shrp_official          ");
set_progress(1.000000);
ui_print("");
EOF
