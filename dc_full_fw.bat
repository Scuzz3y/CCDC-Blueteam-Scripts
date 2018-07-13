::Strict
netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
netsh advfirewall firewall add rule name=web action=allow protocol=tcp program=whereverthefuckfirefoxis remoteport=80,443(or proxy) remoteip=<proxy> dir=out


::Logging
netsh advfirewall set allprofiles logging filename %systemroot%\system32\LogFiles\Firewall\fw.log
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable 

netsh advfirewall firewall add rule name=lo action=allow remoteip=127.0.0.1 dir=in
netsh advfirewall firewall add rule name=lo action=allow remoteip=127.0.0.1 dir=out
netsh advfirewall firewall add rule name=ping action=allow protocol=icmpv4:8,any dir=in
netsh advfirewall firewall add rule name=ping action=allow protocol=icmpv4:8,any dir=out

::DNS
netsh advfirewall firewall add rule name=dnssrv action=allow protocol=udp localport=53 dir=in
netsh advfirewall firewall add rule name=dnssrv action=allow protocol=udp localport=53 dir=out
netsh advfirewall firewall add rule name=dnsfwd action=allow protocol=udp remoteport=53 remoteip=<fwd IP> dir=out

::DC Stuff - IN
::Be Careful, these are allowed to localsubnet which might break scoring
netsh advfirewall firewall add rule name=AD-tcp-in action=allow protocol=tcp localport=389,445,88,636,135,3268 remoteip=localsubnet dir=in 
netsh advfirewall firewall add rule name=AD-udp-in action=allow protocol=udp localport=389,445,88,636,135,123 remoteip=localsubnet dir=in 
netsh advfirewall firewall add rule name=rpc action=allow protocol=tcp localport=rpc dir=in
::netsh advfirewall firewall add rule name=epmap action=allow protocol=tcp localport=rpc-epmap dir=in

::DC Stuff - Out
::Be Careful, these are allowed to localsubnet which might break scoring
netsh advfirewall firewall add rule name=AD-tcp-out action=allow protocol=tcp localport=389,445,88,636,135,3268 remoteip=localsubnet dir=out
netsh advfirewall firewall add rule name=AD-udp-out action=allow protocol=udp localport=389,445,88,636,135,123 remoteip=localsubnet dir=out 
netsh advfirewall firewall add rule name=rpc action=allow protocol=tcp localport=rpc dir=in
::netsh advfirewall firewall add rule name=epmap action=allow protocol=tcp localport=rpc-epmap dir=out



::Web
netsh advfirewall firewall add rule name=web action=allow protocol=tcp program=whereverthefuckfirefoxis remoteport=80,443(or proxy) remoteip=<proxy> dir=out

::IPv6
netsh advfirewall firewall add rule name=lo action=allow remoteip=<IP(FE08)> dir=in
netsh advfirewall firewall add rule name=lo action=allow remoteip=<IP(FE08)> dir=out
netsh advfirewall firewall add rule name=ping action=allow protocol=icmpv6:128,any dir=in
netsh advfirewall firewall add rule name=ns action=allow protocol=icmpv6:135,any dir=in
netsh advfirewall firewall add rule name=ns action=allow protocol=icmpv6:135,any dir=out
netsh advfirewall firewall add rule name=na action=allow protocol=icmpv6:136,any dir=in
netsh advfirewall firewall add rule name=na action=allow protocol=icmpv6:136,any dir=out

::syslog inject
netsh advfirewall firewall add rule name=syslog action=allow protocol=udp localport=514 dir=in

::WSUS
netsh advfirewall firewall add rule name=wsus action=allow protocol=tcp localport=8530,8531 dir=in
