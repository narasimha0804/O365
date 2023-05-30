# Import-Module ExchangeOnlineManagement
# $credential = Get-Credential
# Connect-ExchangeOnline -Credential $credential -ShowProgress $true
# Set-OrganizationConfig -OnlineMeetingsByDefaultEnabled $false
# Get-OrganizationConfig | ft OAuth*



# Import-Module MicrosoftTeams
# Connect-MicrosoftTeams -Credential $credential
# Get-CSOAuthConfiguration
# Disconnect-MicrosoftTeams

#Connect-ExchangeOnline -UserPrincipalName nbanda@flagshipinc.com

#Start-Transcript -Path $PSScriptRoot\$LogFile.log -NoClobber
cls
# Get list of all Office 365 Groups
$groups = Get-UnifiedGroup

# Uncomment this to test on one group
$groups = Get-UnifiedGroup -Identity "DENSSustainabilityCommittee@densfs.com"

foreach ($group in $groups) {

Try {
# Get list of all members
$members = Get-UnifiedGroupLinks -Identity $group.Name -LinkType Members
Write-Host "Members of ""$($group.DisplayName)"":" -ForegroundColor Green
Write-Host ($members | Format-Table | Out-String)

# Get list of all subscribers
$subscribers = Get-UnifiedGroupLinks -Identity $group.Name -LinkType Subscribers
Write-Host "Subscribers of ""$($group.DisplayName)"":" -ForegroundColor Green
Write-Host ($subscribers | Format-Table | Out-String)

# Subscribe all members not subscribed
Write-Host "Subscribing all members not currently subscribed..."
foreach ($member in $members) {
If ($member.Name -notin $subscribers.Name) {
Write-Host "Adding $($member.Name)."
Add-UnifiedGroupLinks -Identity $group.Name -LinkType Subscribers -Links $member.Name
} else {
Write-Host "$($member.Name) is already subscribed."
}
}

# Done!
Write-Host "Done!" -ForegroundColor Green
} Catch {
Write-Host "There was an error subscribing all users in ""$($group.DisplayName)""." -ForegroundColor Red
Write-Host $($Error[0].Exception) -ForegroundColor Red
Continue
}
}

# End logging
#Stop-Transcript