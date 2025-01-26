# PsExec command variations

```powershell
# Run process as system  
Start-Process -FilePath "powershell" -ArgumentList "-WindowStyle Hidden -Command Start-Process -NoNewWindow 'c:\tools\pstools\psexec64.exe' '-i -s -accepteula $(Read-Host "Elevated")'"
```  

```powershell
# Run process as another user  
Start-Process -FilePath "powershell" -ArgumentList "-WindowStyle Hidden -Command Start-Process -NoNewWindow 'c:\tools\pstools\psexec64.exe' '-u User -p Password321 -accepteula -i -h $(Read-Host "Elevated")'"
```

```powershell
# Run script as another user using powershell 
Start-Process -FilePath "powershell" -ArgumentList "-WindowStyle Hidden -Command Start-Process -NoNewWindow 'c:\tools\pstools\psexec64.exe' '-u User -p Password321 -accepteula -i -h powershell -WindowStyle Hidden -File C:\Users\Administrator\desktop\myscript.ps1'"
```

```powershell
# Run script as another user using cmd
cmd /c start /min "" powershell -WindowStyle Hidden -Command Start-Process -NoNewWindow 'c:\tools\pstools\psexec64.exe' '-u User -p Password321 -accepteula -i -h powershell -WindowStyle Hidden -File "C:\Users\Administrator\desktop\myscript.ps1"'
```

