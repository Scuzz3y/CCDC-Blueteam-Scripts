#!/bin/bash

COM="iptables"
GOOD="-j ACCEPT"
BAD="-j DROP"
IN="$COM -A INPUT"
OUT="$COM -A OUTPUT"
UDP="-p udp --dport"
TCP="-p tcp --dport"
# Flush
$COM -F
$COM -X
iptables -F
iptables -X
# INPUT
$IN -i lo $GOOD # loopback
$IN -m state --state REL,EST $GOOD # related
$IN $TCP 22 $GOOD # ssh
$IN $TCP 25 $GOOD # SMTP
$IN $TCP 587 $GOOD # Submission
$IN $TCP 143 $GOOD # IMAP
$IN $BAD # Drop everything else
echo Input locked...
# OUTPUT
$OUT -m state --state REL,EST $GOOD
$OUT -o lo $GOOD
$OUT $UDP 53 $GOOD # DNS
$OUT $BAD
# lockout timer add a command parameter to save changes
if [[ "$1" == "" ]]; then
echo Rules will be flushed in 15 seconds...
(sleep 15 && $COM -F && echo Rules Flushed)&
fi
