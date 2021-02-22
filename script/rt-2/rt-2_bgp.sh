#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

set interfaces loopback lo address 2.2.2.2/32
set interfaces dummy dum0 address 22.22.22.22/32

set protocols bgp 65001 neighbor 192.168.10.10 remote-as '65000'
set protocols bgp 65001 neighbor 192.168.10.10 soft-reconfiguration inbound
set protocols bgp 65001 neighbor 192.168.10.10 update-source 192.168.10.20

set protocols bgp 65001 neighbor 192.168.20.20 remote-as '65002'
set protocols bgp 65001 neighbor 192.168.20.20 soft-reconfiguration inbound
set protocols bgp 65001 neighbor 192.168.20.20 update-source 192.168.20.10

set protocols bgp 65001 parameters router-id '2.2.2.2'
set protocols bgp 65001 network 22.22.22.22/32

commit
exit
