# check if c:\scripts exists, create it if not
$path = "C:\scripts"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
      Write-Host "Created folder c:\scripts"
}
else 
{
    Write-Host "c:\scripts already exists"
}

#### UNINSTALL OTHER VERSIONS OF TEAMVIEWER ####
$file = "C:\scripts\uninstall-teamviewer.bat"
If(!(test-path $file))
{
      Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ctfairhousing/scripts/master/uninstall-teamviewer.bat" -OutFile "C:\scripts\uninstall-teamviewer.bat"
      Write-Host "uninstall-teamviewer.bat script saved to c:\scripts"
}
else 
{
    Write-Host "uninstall-teamviewer.bat script already downloaded to c:\scripts"
}

start-process "cmd.exe" "/c c:\scripts\uninstall-teamviewer.bat"



$teamviewerhost = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Teamviewer 12 Host (MSI Wrapper)"}
$msinumber=$teamviewerhost.IdentifyingNumber

$arguments = "/x $msinumber /qn /norestart"

# UNINSTALL MSI WRAPPER FOR TEAMVIEWER HOST
Start-Process "msiexec.exe" -ArgumentList "$arguments" -Wait -Verb RunAs

# DOWNLOAD G4GE TEAMVIEWER HOST ####
$file_g = "C:\scripts\Teamviewer_Host.msi"
If(!(test-path $file_g))
{
      Invoke-WebRequest -Uri "https://github.com/ctfairhousing/scripts/raw/master/TeamViewer_Host.msi" -OutFile "$file_g"
      Write-Host "Teamviewer_Host.msi saved to c:\scripts"
}
else 
{
    Write-Host "Teamviewer_Host.msi script already downloaded to c:\scripts"
}

# INSTALL G4GE TEAMVIEWER_HOST
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i c:\scripts\TeamViewer_Host.msi /qn /norestart" -Wait  -Verb RunAs
exit
