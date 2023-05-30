#Set Parameters

connect-ExchangeOnline -UserPrincipalName nbanda@densfacilityservices.onmicrosoft.com
$SiteURL = "https://densfacilityservices.sharepoint.com/sites/OfficeManagement/""
$ListName = "Vaccination Tracker"
$DownloadPath = C:\users\nbanda.SPC\Desktop\Folder
 
#Connect to SharePoint Online site
Connect-PnPOnline -Url https://densfacilityservices.sharepoint.com -Interactive
 
#Get all List Items
$Listitems = Get-PnPListItem -List $ListName -PageSize 500
 
#Iterate through List Items
ForEach($Item in $Listitems)
{
    #Get Attachments from List Item
    $Attachments = Get-PnPProperty -ClientObject $Item -Property "AttachmentFiles"
 
    #Download All Attachments from List item
    Write-host "Downloading Attachments from List item '$($Item.ID)', Attachments Found: $($Attachments.Count)"
 
    #Create directory for each list item
    $DownloadLocation = $DownloadPath+$Item.ID
    If (!(Test-Path -path $DownloadLocation)) { New-Item $DownloadLocation -type Directory | Out-Null }
 
    $Attachments | ForEach-Object {
        Get-PnPFile -Url $_.ServerRelativeUrl -FileName $_.FileName -Path $DownloadLocation -AsFile -Force
    }
}







Connect-SPOService -Url https://flagshipinc2-admin.sharepoint.com 


