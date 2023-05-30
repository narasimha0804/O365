
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session

Get-DistributionGroupMember -Identity "HR"

get-help Remove-DistributionGroup -Examples



#Remove user from all the Distribution Groups which he is a member in
$DistributionGroups = Get-Distributiongroup -resultsize unlimited
$UserDName = read-host “Enter User Name"
$UserDName = (Get-Mailbox $User).name
"Searching which groups " + $User + " is a member of and removing membership..."
ForEach ($Group in $DistributionGroups)
{
if ((Get-Distributiongroupmember $Group.Name | select -expand name) -contains $UserDName)
{
write-host "Removing user from group '$Group'"
Remove-DistributionGroupMember -Identity "$Group" -Member "$UserDName" -Confirm:$false
}
}


#Remove all members from a Distribution Group
$DistributionGroupMember = Get-DistributionGroupMember "HR"
ForEach ($member in $DistributionGroupMember)
{
Remove-DistributionGroupMember -Identity HR –Member $member.name -Confirm:$false
}


#delete Distribution Group
Remove-DistributionGroup -Identity "HR" -Confirm