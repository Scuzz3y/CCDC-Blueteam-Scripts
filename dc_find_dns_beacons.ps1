while ($true) { sleep 5 ; clear; get-content C:\dnslog.txt |  ? { $_ -match "\d{4,5}.(\w)+" } | get-unique }
