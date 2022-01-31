#!/bin/sh
echo "Unlocking and Disabling Updates..."
ubus call version set_atcmd_info '{"atcmd":"AT*PROD=2"}' > /dev/null 2&>1
ubus call version set_atcmd_info '{"atcmd":"AT*MRD_IMEI=D"}' > /dev/null 2&>1
ubus call version set_atcmd_info '{"atcmd":"AT*PROD=0"}' > /dev/null 2&>1
sleep 2

echo "Installing Permanent Band Locking Features..."
wget https://github.com/CJGonzales13/R281/blob/main/r281_mtd4_4.2.bin -O /tmp/firmware.bin > /dev/null 2>&1
mtd -r write /tmp/firmware.bin /dev/mtd5 > /dev/null 2&>1
