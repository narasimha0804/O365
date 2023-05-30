
Clear-Host
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

Get-ADUser -Identity “946816” -Properties msExchHideFromAddressLists


Connect-ExchangeOnline -UserPrincipalName nbanda@flagshipinc.com
Set-Mailbox "dlent@flagshipinc.com" -Type Shared

Set-Mailbox -Identity "Payton Moyer"" -HiddenFromAddressListsEnabled $true

Get-Mailbox -Identity "mbarron@flagshipinc.com"

#Disconnect-ExchangeOnline
Get-MailboxPermission "financeaap@flagshipinc.com"
Add-MailboxPermission "financeaap@flagshipinc.com" -User "Keatha Bowie" -AccessRights FullAccess -InheritanceType all

#New-Mailbox -Name "HR" -Alias "HR" -Shared -PrimarySmtpAddress "hr@flagshipinc.com" -DisplayName "HR" 




#Get-Mailbox -Identity flagshipacademy

Get-OrganizationConfig | ft Name, SendFromAliasEnabled

Get-MailboxPermission “FSG Kiosk” | Where-Object { ($_.IsInherited -eq $False) -and -not ($_.User -like “NT AUTHORITY\SELF”) } | Select-Object Identity, user, AccessRights 

Get-RecipientPermission “FSG Kiosk” | Where-Object {($_.IsInherited -eq $False) -and -not ($_.Trustee -like “NT AUTHORITY\SELF”) } | Select-Object Trustee, AccessRights 

Add-MailboxPermission “FSG Kiosk” -User "Sterling Bourne" -AccessRights FullAccess -InheritanceType all -Automapping $false

Add-MailboxPermission -Identity "Ruben Alvarado" -User "rray@flagshipinc.com" -AccessRights FullAccess -InheritanceType All -Automapping $false

Remove-MailboxPermission -Identity "Sharon Glenn" -User "sbarry@flagshipinc.com" -AccessRights FullAccess -InheritanceType All -Confirm:$false

Remove-MailboxPermission -Identity "Atik Lalani" -ClearAutoMapping -Confirm:$false

