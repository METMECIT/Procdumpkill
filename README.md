# Procdumpkill

Many malicious actors use procdump to gather credentials.

Scans for running procdump process every five seconds (this could be changed to one second), sends email to alert IT department it is running, and then kills any running cmd and psexec processes. The email that is sent also contains a text document containing netstat -ano results at the time of the alert.

How to use

Add to every windows device.

add PD.ps1 to C:\scripts (or adjust folder name in both files then save there)
Import PD.xml to task scheduler in a random folder.
