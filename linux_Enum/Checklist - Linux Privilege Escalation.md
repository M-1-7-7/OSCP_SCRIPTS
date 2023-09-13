# Checklist - Linux Privilege Escalation

Use LinPEAS for best results

1. [System Information](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#system-information)
   - [ ] Get OS information
   - [ ] Check the [PATH](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#path) for any writable folder
   - [ ] check the [env variable](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#env-info) for any sensitive detail
   - [ ] Search for any [kernal exploits](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits) using scripts
   - [ ] check if the [sudo version is vulnerble](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version)
   - [ ] [Dmesage signature cerification failed](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed)
   - [ ] [other system info](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#more-system-enumeration)
       - [ ] Date
       - [ ] System Status
       - [ ] CPU Info
       - [ ] Printers
       - [ ] etc
   - [ ] [enum more defences](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#enumerate-possible-defenses)

2. [Drivers](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#enumerate-possible-defenses)
   - [ ] List mounted drivers
   - [ ] list Unmounted drivers
   - [ ] any creds in fstab

3. [Installed Software](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#installed-software)
   - [ ] check for [useful software](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#useful-software) that is installed
   - [ ] check for [vulnerble software](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#vulnerable-software-installed) that is installed
  
4. [Processes](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes)
   - [ ] any unknown software running
   - [ ] software running with more privilage then required
   - [ ] exploits for services running
   - [ ] proccesses we can modify the binary
   - [ ] monitor proccesses and see if they run frequently
   - [ ] can we read come interesting process memory (where passwords may be stored)

6. [Scheduled/Cron jobs](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-jobs)
   - [ ] is the [PATH](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#cron-path) being modified by a cron and can we write in it
   - [ ] Any [Wildcards](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#cron-using-a-script-with-a-wildcard-wildcard-injection) in the cron job
   - [ ] is a [modifiable script](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#cron-script-overwriting-and-symlink) being executed or in a modifiable folder
   - [ ] Is there some script may be [executing frequently](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#frequent-cron-jobs) (every 1,2, or 5 min)
7. [Services](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#services)
   - [ ] Any writable .service file?
   - [ ] Any writable binary executed by a service?
   - [ ] Any writable folder in systemd PATH?
  
8. [Timers](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers)
   - [ ] Any writable timer?
  
9. [Sockets](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets)
    - [ ] Any writable .socket file?
    - [ ] Can you communicate with any socket?
    - [ ] HTTP sockets with interesting info?

10. [D-Bus](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus)
    - [ ] Can you communicate with any D-Bus?
   
11. [Network](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#network)
    - [ ] Enumerate the network to know where you are
    - [ ] Open ports you couldn't access before getting a shell inside the machine?
    - [ ] Can you sniff traffic using tcpdump?

12. [Users](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users)
    - [ ] Generic users/groups enumeration
    - [ ] Do you have a very big UID? Is the machine vulnerable?
    - [ ] Clipboard data?
    - [ ] Password Policy?
    - [ ] Try to use every known password that you have discovered previously to login with each possible user. Try to login also without a password.
    - [ ] Can you [esculate priv due to the group](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe) you bellong to 

13. [Writable Path](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses)
    - [ ] If you have write privileges over some folder in PATH you may be able to escalate privileges
   
14. [SUID and SUDO commands](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid)
    - [ ] Can you execute any command with sudo? Can you use it to READ, WRITE or EXECUTE anything as root? [GTFO Bins](https://gtfobins.github.io/)
    - [ ] Is any exploitable SUID binary? [GTFO Bins](https://gtfobins.github.io/)
    - [ ] Are [Sudo command linited by path](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-execution-bypassing-paths)? can it be bypassed?
    - [ ] [sudo/SUID binary without path indicated](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-command-suid-binary-without-command-path)
    - [ ] [SUID binary specifying path](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#suid-binary-with-command-path) Bypass
    - [ ] [LD_PRELOAD Vuln](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ld_preload)
    - [ ] [Lack of .so library in SUID binary](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#suid-binary-so-injection)from a writable folder
    - [ ] are [Sudo tokens available](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens)? and can I [create SUDO token](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#var-run-sudo-ts-less-than-username-greater-than)?
    - [ ] can i [read or modify sudoers files](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#etc-sudoers-etc-sudoers-d)
    - [ ] can i modify [etc/ld.so.conf.d/](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#etc-ld-so-conf-d)
    - [ ] [OpenBSD DOAS](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#doas) Command
   
15. [Capabilities](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities)
    - [ ] Has any binary any unexpected capability?
   
16. [ACLs](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#acls)
    - [ ] Has any file any unexpected ACL?
   
17. [Open Shell sessions](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-shell-sessions)
    - [ ] screen
    - [ ] tmux

18. [SSH]()
    - [ ] Debian [OpenSSH Predicted PRNG - CVE-2008-0166](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#debian-openssl-predictable-prng-cve-2008-0166)
    - [ ] [SSH Interesting Config Values](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ssh-interesting-configuration-values)
         
20. [interesting files](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#interesting-files)
    - [ ] Profile files - Read sensitive data? Write to privesc?
    - [ ] passwd/shadow files - Read sensitive data? Write to privesc?
    - [ ] Check commonly interesting folders for sensitive data
    - [ ] Weird Location/Owned files, you may have access to or alter executable files
    - [ ] Modified in last mins
    - [ ] Sqlite DB files
    - [ ] Hidden files
    - [ ] Script/Binaries in PATH
    - [ ] Web files (passwords?)
    - [ ] Backups?
    - [ ] Known files that contains passwords: Use Linpeas and LaZagne
    - [ ] Generic search

21. [writable files](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files)
    - [ ] Modify python library to execute arbitrary commands?
    - [ ] Can you modify log files? Logtotten exploit
    - [ ] Can you modify /etc/sysconfig/network-scripts/? Centos/Redhat exploit
    - [ ] Can you write in [**ini, ini.d, systemd or rc.d** files](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#init-init-d-systemd-and-rc-d)

22. [Other trips](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#other-tricks)
    - [ ] Can you [abuse NFS](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#nfs-privilege-escalation) to esculate priv
    - [ ] do we need to [escape a retricted shell](https://book.hacktricks.xyz/linux-hardening/privilege-escalation#escaping-from-restricted-shells)
    
