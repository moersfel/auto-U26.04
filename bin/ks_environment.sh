#!/bin/bash

###############################################################################
# These point to where the kickstart server and files are located on the 
# remote server
###############################################################################

export ISO_SERVER=pc48.cs.ucdavis.edu
export ISO_PATH=/F4

export KICKSTART_SERVER=pc48.cs.ucdavis.edu
export KICKSTART_PATH=/KS-F4

# Paths relative to KICKSTART_SERVER:KICKSTART_PATH
export SCRIPTS_PATH=/scripts
export SCRIPTS_SUPPORT_PATH=/support_files
export PKG_BIN_PATH=/packages/binaries
export PKG_SCRIPT_PATH=/packages/install_scripts

###############################################################################
# These are relative to the machine being kickstarted
###############################################################################

export KICKSTART_MNT=/mnt/ks
export TMP_PATH=/tmp/ks_tmp
export LOG_DIR=/root/ks_log

export SUBNET_MASK=255.255.255.0
export GATEWAY=169.237.5.254
export NAME_SERVER=169.237.6.10
export NIS_SERVER=169.237.5.6
export NIS_DOMAIN=instr.nis


