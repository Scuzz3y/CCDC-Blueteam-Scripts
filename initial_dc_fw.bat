netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

:: Allow Scored Services In and Out
netsh advfirewall firewall add rule name=dnssrv action=allow protocol=udp localport=53 dir=in
netsh advfirewall firewall add rule name=dnssrv action=allow protocol=udp localport=53 dir=out

:: DNS FWD
netsh advfirewall firewall add rule name=dnsfwd action=allow protocol=udp remoteport=53 remoteip= dir=out

netsh advfirewall firewall add rule name=ldap-tcp action=allow protocol=tcp localport=389 dir=in
netsh advfirewall firewall add rule name=ldap-tcp action=allow protocol=tcp localport=389 dir=out
netsh advfirewall firewall add rule name=ldap-udp action=allow protocol=udp localport=389 dir=in
netsh advfirewall firewall add rule name=ldap-udp action=allow protocol=udp localport=389 dir=out

:: RDP
netsh advfirewall firewall add rule name=rdp-tcp action=allow protocol=tcp localport=3389 dir=in
netsh advfirewall firewall add rule name=rdp-tcp action=allow protocol=tcp localport=3389 dir=out
