REM Kill TeamViewer Process
taskkill /f /im teamviewer*
REM Remove Older Versions
for /d %%F in ("C:\Program Files\TeamViewer\*") do "%%F\uninstall.exe" /S
for /d %%F in ("C:\Program Files (x86)\TeamViewer\*") do "%%F\uninstall.exe" /S
REM Remove Newer Versions
"C:\Program Files\TeamViewer\uninstall.exe" /S
"C:\Program Files (x86)\TeamViewer\uninstall.exe" /S