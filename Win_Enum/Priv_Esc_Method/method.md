# Checklist - Local Windorws privilage Escalation

**Run Linpeas for best results**

1. [System Info: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#system-info)
   - [ ] Obtain System Info
   - [ ] Search for [**Kernal exploits**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#version-exploits)
   - [ ] Use **Google** to search for **Kernal** exploitsUse Google to search for kernel exploits
   - [ ] Use **searchsploit** to search for **kernel** exploits
   - [ ] Interesting Info in [**env vars**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#environment)
   - [ ] Passwords in [**Powershell History**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#powershell-history)
   - [ ] Interesting info in [**Internet settings**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#internet-settings)
   - [ ] [Drivers](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#drives)
   - [ ] [**WSUS exploit**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#wsus)
   - [ ] [**AllwaysIOnstallElevated** Vulnerbility](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#alwaysinstallelevated)

2. [Logging/AV enumeration: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#enumeration)
   - [ ] Check [Audit](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#audit-settings) and [WEF](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#wef) settings
   - [ ] Check [LAPS](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#laps)
   - [ ] Check if [**WDigest**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#wdigest) is active
   - [ ] [LSA Protection](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#lsa-protection)
   - [ ] [Credentials Guard](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#credentials-guard)
   - [ ] [Cached Credentials](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#cached-credentials)
   - [ ] Check for [**AV**](https://github.com/carlospolop/hacktricks/blob/master/windows-hardening/windows-av-bypass/README.md)
   - [ ] [**Applocker** Policy](https://github.com/carlospolop/hacktricks/blob/master/windows-hardening/authentication-credentials-uac-and-efs/README.md#applocker-policy)
   - [ ] [**UAC**](https://github.com/carlospolop/hacktricks/blob/master/windows-hardening/authentication-credentials-uac-and-efs/uac-user-account-control/README.md)
   - [ ] [**User Priv**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#users-and-groups)
      - [ ] Current User Privilages
      - [ ] Current group privilages
      - [ ] User Sessions
      - [ ] users homes (access)
      - [ ] Password Policy
      - [ ] what is in the clipboard

3. [Network: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#network)
   - [ ] Check current [**network information**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#network)
   - [ ] check **hidden local services** hidden to the outside
   - [ ] Enumerate the network (shares, interfaces, routes, neighbours, ...)
   - [ ] Take a special look at network services listening on localhost (127.0.0.1)

4. [Running Processes: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#running-processes)
   - [ ] Processes Binaries [files and folder permisions](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#file-and-folder-permissions)
   - [ ] [**Memory Password mining**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#memory-password-mining)
   - [ ] [Insecure GUI apps](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#insecure-gui-apps)

5. [Services: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#services)
   - [ ] can you [modify services](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#permissions)
   - [ ] can you modify the [binary that is executed by any service](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#modify-service-binary-path)
   - [ ] Can you [modify the registry of any service](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#services-registry-modify-permissions)
   - [ ] can you take advantage of [unqoted service path](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#unquoted-service-paths)

6. [Applications: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#applications)
   - [ ] any [**Write** permisions on installed applications](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#write-permissions)
   - [ ] [**Startup Applications**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#run-at-startup)
   - [ ] [**Vulnerble Drivers**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#drivers)

7. [DLL Hijacking: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#path-dll-hijacking)
   - [ ] Can you write in any folder inside PATH?
   - [ ] Is there any known service binary that tries to load any non-existant DLL?
   - [ ] Can you write in any binaries folder?
  
8. [Windows Credentials: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#windows-credentials)
   - [ ] [Winlogon](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#winlogon-credentials) Credentials
   - [ ] [Windows Vault](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#credentials-manager-windows-vault) that could be used
   - [ ] [DPAPI credentials](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#dpapi) that are interesting
   - [ ] [Wifi Network](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#wifi) credentials
   - [ ] [saved **RDP** Credentials](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#saved-rdp-connections)
   - [ ] Password in [Recently Run Commands](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#recently-run-commands)
   - [ ] [RDP Credential Manager](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#remote-desktop-credential-manager) passwords
   - [ ] if [**AppCmd.exe** exists](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#appcmd-exe) there may be credentials
   - [ ] [SCClient.exe](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#scclient-sccm) for DLL side loading
  
9. [Files and Registry Credentials: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#files-and-registry-credentials)
   - [ ] **Putty:** [creds](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#putty-creds) and [SSH Host Keys](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#putty-ssh-host-keys)
   - [ ] [SSH Keys in Registry](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#ssh-keys-in-registry)  
   - [ ] Passwords in [unattended files](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#unattended-files)
   - [ ] [**SAM and SYSTEM**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#sam-and-system-backups) File backups
   - [ ] [**Cloud Credentials**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#cloud-credentials)
   - [ ] [**McAfee SiteList.xml**](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#mcafee-sitelist.xml)
   - [ ] [Cached GPP Passwords](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#cached-gpp-pasword)
   - [ ] [IIS Web Config file](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#iis-web-config) Passwords
   - [ ] [web logs](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#logs)
   - [ ] [ask the user for credentials](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#ask-for-credentials)
   - [ ] [Recycle Bin](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#credentials-in-the-recyclebin)
   - [ ] credential contained in [Registry](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#inside-the-registry)
   - [ ] [Browser Data](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#browsers-history)
   - [ ] Generic [Password Search](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#generic-password-search-in-files-and-registry) in files and reg
   - [ ] [Tools](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#tools-that-search-for-passwords) to automate the search

10. [Leaked Handlers: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#leaked-handlers)
   - [ ] Have you access to any handler of a process run by administrator?

11. [Pipe Client Impersonation: ](https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation#named-pipe-client-impersonation)
   - [ ] Check if we can use it
