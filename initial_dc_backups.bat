netstat -ano | findstr LIST | sort > stat.txt
dir /B /S \windows\system32 > 32.txt
dir /B /S \*.exe > exes.txt
net share > shares.txt
tasklist /svc /FO svc | sort > tl.txt
net user > users.txt
net group “Domain Admins” > dadmins.txt
net start > svcs.txt
