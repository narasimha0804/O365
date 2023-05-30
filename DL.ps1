Connect-ExchangeOnline -UserPrincipalName nbanda@flagshipinc.com
Get-DistributionGroupMember -Identity “Flagship Painting” | select Name, PrimarySMTPAddress | Export-CSV C:\Users\nbanda.SPC\Desktop\Southlakeofficestaff.csv


Disconnect-ExchangeOnline

$RecipientIdentity=(Get-Recipient "mpatel@flagshipinc.com"").Identity 
Get-Mailbox | where {$_.ForwardingAddress -eq $RecipientIdentity} | select Name, Alias 


# $O365Groups=Get-UnifiedGroup
# ForEach ($Group in $O365Groups)
# {
#     Write-Host "Group Name:" $Group.DisplayName -ForegroundColor Green
#     Get-UnifiedGroupLinks -Identity $Group.Id -LinkType Members | Select DisplayName,PrimarySmtpAddress
 
#     #Get Group Members and export to CSV
#     Get-UnifiedGroupLinks -Identity $Group.Id -LinkType Members | Select-Object @{Name="Group Name";Expression={$Group.DisplayName}},`
#          @{Name="User Name";Expression={$_.DisplayName}}, PrimarySmtpAddress | Export-CSV "C:\Users\nbanda.SPC\Desktop\DENSM365users.csv" -NoTypeInformation -Append
# }

# #get members for Dynamic DL
# $FTE = Get-DynamicDistributionGroup -Identity "All DENS"
# Get-Recipient -RecipientPreviewFilter ($FTE.RecipientFilter)



$userlist = Import-CSV C:\Users\nbanda.SPC\Desktop\adtidsy.csv
 
ForEach ($user in $userlist)
{
Add-DistributionGroupMember -Identity "alldens@flagshipinc.com" -Member $user.PrimarySmtpAddress
}


Get-DistributionGroupMember -Identity "All Dens"  | Export-csv -path C:\users\nbanda.SPC\Desktop\alldensusers.csv


Remove-DistributionGroupMember -Identity "denversupervisors@flagshipinc.com" -Member "Joseph Boateng"

Set-Mailbox -Identity "joel_telfort@densfs.com" -Type Shared

Set-Mailbox -Identity "vesparza@flagshipinc.com" -Type Shared

Get-Mailbox -Identity "joel_telfort@densfs.com" | Format-Table Name, RecipientTypeDetails

Get-User "cgallardo@flagshipinc.com" | select -ExpandProperty DistinguishedName

Get-Recipient -Filter "Members -eq 'CN=Cesar Gallardo,OU=flagshipinc2.onmicrosoft.com,OU=Microsoft Exchange Hosted Organizations,DC=NAMPR13A007,DC=PROD,DC=OUTLOOK,DC=COM'" -RecipientTypeDetails GroupMailbox,MailUniversalDistributionGroup,MailUniversalSecurityGroup | select Name


Get-DistributionGroupMember -Identity "denversupervisors@flagshipinc.com" | select DisplayName 