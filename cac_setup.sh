#!/bin/bash

# This script pulls down a CAC setup script from https://github.com/jdjaxon/linux_cac
# It will set the permissions for the script and run it to enable use of DoD CAC on Linux

echo "Starting CAC installation"
echo "Closing all Firefox and Chrome browsers"

if pgrep chrome; then 
    sudo pkill chrome || { echo "Killing Chrome failed" ; exit 1; }
fi

if pgrep firefox; then 
    sudo pkill firefox || { echo "Killing Firefox failed" ; exit 1; }
fi

echo "Fetch and execute setup script"

sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/jdjaxon/linux_cac/main/cac_setup.sh)" ||
    { echo 'Failed to curl or run script' ; exit 1; }
