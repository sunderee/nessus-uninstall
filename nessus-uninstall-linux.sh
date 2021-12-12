#!/usr/bin/env bash
debug_print() {
    STARTCOLOR="\e[92m";
    ENDCOLOR="\e[0m";

    printf "\n$STARTCOLOR%b$ENDCOLOR\n" "$1";
}

operating_system=$( (lsb_release --description --short || cat /etc/*release || uname --operating-system --machine) 2>/dev/null | head -n1 )
printf "Running on %s" "$operating_system"

debug_print "Step 1: Stop the Nessus service"
sudo /sbin/service nessusd stop

nessus=$(sudo rpm --query --all | grep Nessus)
debug_print "Step 2: Uninstall Nessus package: ${nessus}"
sudo rpm --erase "$nessus"
