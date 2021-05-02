# Copyright (c) 2018 Tolland Public Schools
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
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
