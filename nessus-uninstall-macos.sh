#!/usr/bin/env bash
debug_print() {
    STARTCOLOR="\e[92m";
    ENDCOLOR="\e[0m";

    printf "\n$STARTCOLOR%b$ENDCOLOR\n" "$1";
}

debug_print "Step 1: Remove Nessus files and directories"
sudo rm --recursive --force /Library/Nessus
sudo rm --recursive --force /Library/LaunchDaemons/com.tenablesecurity.nessusd.plist
sudo rm --recursive --force /Library/PreferencePanes/Nessus Preferences.prefPane
sudo rm --recursive --force /Applications/Nessus

debug_print "Step 2: Disable the Nessus service"
sudo launchctl remove com.tenablesecurity.nessusd