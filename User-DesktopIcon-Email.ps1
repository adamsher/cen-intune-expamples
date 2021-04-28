<#
    .SYNOPSIS
        Adds a shortcut to a web app using the default browser.
    .DESCRIPTION
        Author:  John Seerden (https://www.srdn.io)
        Version: 1.0

        Adds a shortcut to a web app, using the default browser, in the Start Menu and/or on the User's Desktop.
    .PARAMETER ShortcutName
        Display Name of the shortcut.
    .PARAMETER ShortcutUrl
        URL associated with the shortcut.
    .PARAMETER ShortcutIconLocation
        Optional: Path to an icon to associate with the shortcut.
    .PARAMETER ShortcutOnDesktop
        Set to $true if the Shortcut needs to be added to the assigned User's Profile Desktop.
    .PARAMETER ShortcutInStartMenu
        Set to $true if the Shortcut needs to be added to the assigned User's Start Menu.
    .NOTES
        This scripts needs to run using the logged on credentials.
#>
param(
    [string]$ShortcutName         = "Tolland Email",
    [string]$ShortcutUrl          = "http://mail.tolland.k12.ct.us",
    [string]$ShortcutIconLocation = "https://ssl.gstatic.com/ui/v1/icons/mail/favicon.ico",
    [bool]$ShortcutOnDesktop      = $true,
    [bool]$ShortcutInStartMenu    = $false
)

$version = "2020-06-19-1"
Write-Output "User-DesktopIconEmail.ps1 version $version ran at $(Get-Date)"

$WScriptShell = New-Object -ComObject WScript.Shell

if ($ShortcutOnDesktop) {
    $Shortcut = $WScriptShell.CreateShortcut("$env:USERPROFILE\Desktop\$ShortcutName.lnk") 
    $Shortcut.TargetPath = $ShortcutUrl
    if ($ShortcutIconLocation) {
        $Shortcut.IconLocation = $ShortcutIconLocation
    }
    $Shortcut.Save()
}

if ($ShortCutInStartMenu) {
    $Shortcut = $WScriptShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$ShortcutName.lnk") 
    $Shortcut.TargetPath = $ShortcutUrl 
    if ($ShortcutIconLocation) {
        $Shortcut.IconLocation = $ShortcutIconLocation
    }
    $Shortcut.Save()
}

