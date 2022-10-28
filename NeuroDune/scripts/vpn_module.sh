#!/bin/bash
vpn_status() {
  local stat="$(/usr/bin/nordvpn status | awk -F:" " '{ print $2 }' | head -1)"
  if [[ $stat == "Connected" ]]; then 
	  echo "VPN:  "
  else
	  echo "VPN: "
  fi
}
if vpn_status; then exit 0; else exit 1; echo "error exec vpn_status...exit=1";fi

