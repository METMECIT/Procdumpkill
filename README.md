# Procdumpkill

Many malicious actors use procdump to gather credentials.

Scans for running procdump process every five seconds (this could be changed to one second), sends email to alert IT department it is running, and then kills any running procdump processes. The email that is sent also contains a text document containing netstat -ano results at the time of the alert.

# How to use

Add to every windows device.

add PD.ps1 to C:\scripts (or adjust folder name in both files then save there)
Import PD.xml to task scheduler in a random folder.


# GPO deploy

We used four tasks to troubleshoot where a deployment issue occurred. Others may only need one.

Computer/User > Preferences > Control Panel Settings > Scheduled Tasks

# Make Scripts folder

Name: Mkscr

User/Group:  NT Authority\System

Run with highest privleges: Yes

Trigger: Daily -- 10:30:00AM, After triggered run every hour for one day. Expire a few days later.

Actions: Start A Program

--Program/Script: C:\windows\system32\CMD.exe

--Add arguments: cmd /c mkdir c:\scripts

# Copy PD.ps1 to scripts folder

Name: Copy1D

User/Group:  NT Authority\System

Run with highest privleges: Yes

Trigger: Daily -- 10:32:00AM, After triggered run every hour for one day. Expire a few days later.

Actions: Start A Program

--Program/Script: C:\windows\system32\CMD.exe

--Add arguments: cmd /c copy "\\PATH\PD.ps1" "C:\scripts"

# Copy PD.xml to scripts folder

Name: Copy2D

User/Group:  NT Authority\System

Run with highest privleges: Yes

Trigger: Daily -- 10:34:00AM, After triggered run every hour for one day. Expire a few days later.

Actions: Start A Program

--Program/Script: C:\windows\system32\CMD.exe

--Add arguments: cmd /c copy "\\PATH\PD.xml" "C:\scripts"

# Import PS.xml into task scheduler

Name: Copy2D

User/Group:  NT Authority\System

Run with highest privleges: Yes

Trigger: Daily -- 10:36:00AM, After triggered run every hour for one day. Expire a few days later.

Actions: Start A Program

--Program/Script: C:\windows\system32\CMD.exe

--Add arguments: cmd /c schtasks.exe /create /XML "C:\scripts\PD.xml" /ru "NT Authority\SYSTEM" /tn "\PD"
