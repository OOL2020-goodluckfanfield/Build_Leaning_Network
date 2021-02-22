#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

set protocols ospf area 0 network 192.168.10.0/24
set protocols ospf area 0 network 192.168.20.0/24
set protocols ospf passive-interface eth0
set protocols ospf passive-interface eth1
set protocols ospf passive-interface lo
set protocols ospf passive-interface dum0

commit
exit
