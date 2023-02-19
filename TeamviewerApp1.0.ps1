#Checkt of TeamviewerQS aanwezig is.
$Folder = 'C:\Program Files\Intune\Teamviewer\Teamviewer.exe'
if (Test-Path -Path $Folder) {
    Write-Host "TeamviewerQS staat in de map" -ForegroundColor Green
}
else {
    Write-Host "Teamviewer QS is niet gevonden! Deze zal nu worden gedownload...." -ForegroundColor DarkYellow
    New-Item -Path "C:\Program Files\Intune" -ItemType Directory -ErrorAction Ignore
    New-Item -Path "C:\Program Files\Intune\Teamviewer" -ItemType Directory -ErrorAction Ignore
    Invoke-WebRequest -Uri "https://download.teamviewer.com/QS" -outfile "$Folder"
    Write-Host "Teamviewer staat in de folder" (Test-Path $Folder) -ForegroundColor Blue
}

#Ceate shortcut on Desktop
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\$env:USERNAME\Desktop\Teamviewer.lnk")
$Shortcut.TargetPath = "C:\Program Files\Intune\Teamviewer\Teamviewer.exe"
$Shortcut.Save()



