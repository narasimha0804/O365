$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection


Import-Module ExchangeOnlineManagement; Get-Module ExchangeOnlineManagement
#Update-Module -Name ExchangeOnlineManagement


Connect-ExchangeOnline -UserPrincipalName nbanda@flagshipinc.com
Get-DistributionGroupmember 
Get-TransportService | Get-MessageTrackingLog -Recipients "itadmins@flagshipinc.com" -EventId RECEIVE -Source SMTP | Sort-Object Timestamp -Descending | select Timestamp,Sender,MessageSubject -First 1

Disconnect-ExchangeOnline

Get-MessageTrace -Status expanded -startdate (get-date).AddDays(-10) -EndDate (Get-Date) | group recipientaddress | select name,count