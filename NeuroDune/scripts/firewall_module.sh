#!/bin/bash

firewalld_status() {
  local stat="$(systemctl is-active firewalld)"
  if [[ $stat == "active" ]]; then
      echo "FW: 撚"
  else
      echo "FW:  "
  fi
}  
if firewalld_status; then exit 0; else echo "error exec firewalld_status()...exit=1"; exit 1;fi


