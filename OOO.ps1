$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
 Import-PSSession $Session
 Set-MailboxAutoReplyConfiguration -Identity "lparis@flagshipinc.com" -AutoReplyState Enabled -InternalMessage "Thank you for your email. Please direct all inquiries to procurement@flagshipinc.com or khaggard@flagshipinc.com" -ExternalMessage "Thank you for your email. Please direct all inquiries to procurement@flagshipinc.com or khaggard@flagshipinc.com"


