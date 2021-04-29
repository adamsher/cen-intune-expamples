$version = "2020-06-18-1"
Write-Output "Computer-AllowGuestAuthForPrinters.ps1 version $version ran at $(Get-Date)"


if (!(Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation')){
    New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows -Name LanmanWorkstation
}

Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation -Name AllowInsecureGuestAuth -Type DWord -Value 1
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters -Name AllowInsecureGuestAuth -Type DWord -Value 1
