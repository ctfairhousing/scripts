$ChocoPackages = @(“googlechrome”,"ublockorigin-chrome”,"7zip”,”notepadplusplus.install”,”7zip.install”,"firefox","ublockorigin-firefox", "paint.net")

$ChocoInstall = Join-Path ([System.Environment]::GetFolderPath(“CommonApplicationData”)) “Chocolatey\bin\choco.exe”


if(!(Test-Path $ChocoInstall)) {
        try {

            Invoke-Expression ((New-Object net.webclient).DownloadString(‘https://chocolatey.org/install.ps1’)) -ErrorAction Stop
        }
        catch {
            Throw “Failed to install Chocolatey”
        }      
}

foreach($Package in $ChocoPackages) {
    try {
        Invoke-Expression “cmd.exe /c $ChocoInstall Install $Package -y” -ErrorAction Stop
    }
    catch {
        Throw “Failed to install $Package”
    }
}