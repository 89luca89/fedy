#!/bin.bash

dnf -y install tlp tlp-rdw powertop smartmontools
systemctl enable powertop.service
systemctl enable tlp.service
systemctl enable tlp-sleep.service
tlp start true
semanage fcontext -a -t ifconfig_var_run /run/tlp/lock_tlp
restorecon -R -v /run/tlp/lock_tlp

