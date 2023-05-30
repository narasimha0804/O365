#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
#Import-PSSession $Session

Clear-Host
#Install-Module -Name ExchangeOnlineManagement
connect-ExchangeOnline -UserPrincipalName nbanda@flagshipinc.com

Get-MailboxFolderPermission execteamcalendar@flagshipinc.com:\calendar

Add-MailboxFolderPermission -identity execteamcalendar@flagshipinc.com:\calendar -user tdenisco@flagshipinc.com -AccessRights Owner

Remove-MailboxFolderPermission -Identity execteamcalendar@flagshipinc.com:\calendar -user mthompson@flagshipinc.com -Confirm:$false

(Get-DistributionGroupMember "dfwhr").Count   


Disconnect-ExchangeOnline 

Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.6-Preview5 -AllowPrerelease

Get-ManagementRoleAssignment -Role “ApplicationImpersonation” -GetEffectiveUsers
