#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

set interfaces loopback lo address 1.1.1.1/32
set interfaces dummy dum0 address 11.11.11.11/32

set protocols bgp 65000 neighbor 192.168.10.20 remote-as '65001'
set protocols bgp 65000 neighbor 192.168.10.20 soft-reconfiguration inbound
set protocols bgp 65000 neighbor 192.168.10.20 update-source 192.168.10.10
set protocols bgp 65000 parameters router-id '1.1.1.1'
set protocols bgp 65000 network 11.11.11.11/32

commit
exit
