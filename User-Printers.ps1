# Created by Tolland Public Schools 2019
# For use with computers that an access a domain print server or server & client are configured for guest access

$version = "2020-11-11-1"
Write-Output "User-Printers.ps1 version $version ran at $(Get-Date)"

$computer = [System.Net.Dns]::GetHostName().ToLower()

$Network = New-Object -ComObject Wscript.Network

# Use an if block for each printer
if (
   (
      $computer.StartsWith('it-') -Or 
      $computer.StartsWith('et-')
   )
) {
   $Network.AddWindowsPrinterConnection("\\print-server\Printer1")
   $Network.AddWindowsPrinterConnection("\\print-server\Printer 2")
}