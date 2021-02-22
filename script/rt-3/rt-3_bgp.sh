#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

set interfaces loopback lo address 3.3.3.3/32
set interfaces dummy dum0 address 33.33.33.33/32

set protocols bgp 65002 neighbor 192.168.20.10 remote-as '65001'
set protocols bgp 65002 neighbor 192.168.20.10 soft-reconfiguration inbound
set protocols bgp 65002 neighbor 192.168.20.10 update-source 192.168.20.20
set protocols bgp 65002 parameters router-id '3.3.3.3'
set protocols bgp 65002 network 33.33.33.33/32

commit
exit
