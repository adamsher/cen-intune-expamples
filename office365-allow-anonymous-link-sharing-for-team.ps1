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
# Requires SharePoint Online Management Shell
# Can be installed by running the following command in PowerShell: Install-Module -Name Microsoft.Online.SharePoint.PowerShell
# Log in to SharePoint Online
# Replace "tolland" with your Azure domain
Connect-SPOService -Url https://tolland-admin.sharepoint.com
# Get the team name from the user
$team = Read-Host 'Team name, no spaces: '
# Replace "tolland" with your Azure domain
$siteurl="https://tolland.sharepoint.com/sites/" + $team
# Enable anonymous links
set-sposite -identity $Siteurl -sharingcapability ExternalUserAndGuestSharing
