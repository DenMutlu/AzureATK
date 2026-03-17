# This script is a part of Attacking and Defending Azure - Beginner's Edition course by Altered Security
# https://www.alteredsecurity.com/azureadlab


# Old script from https://learn.microsoft.com/en-us/entra/identity/app-proxy/scripts/powershell-display-users-group-of-app


function Get-MgApplicationProxyAssignedUsersAndGroups
{
param(
[string] $ObjectId = "null"
)

$aadapServPrincObjId=$ObjectId

If ($aadapServPrincObjId -eq "null") {

Write-Host "Parameter is missing." -BackgroundColor "Black" -ForegroundColor "Green"
    Write-Host " "
    Write-Host "Get-MgApplicationProxyAssignedUsersAndGroups -ObjectId <ObjectId of the application>" -BackgroundColor "Black" -ForegroundColor "Green"
    Write-Host " "
    return
}


Write-Host "Reading users. This operation might take longer..." -BackgroundColor "Black" -ForegroundColor "Green"

$users= Get-MgUser -Top 1000000

Write-Host "Reading groups. This operation might take longer..." -BackgroundColor "Black" -ForegroundColor "Green"

$groups = Get-MgGroup -Top 1000000

try {$app = Get-MgServicePrincipal -Filter "Id eq '$aadapServPrincObjId'"}

catch {

Write-Host "Possibly the ObjetId is incorrect." -BackgroundColor "Black" -ForegroundColor "Red"
    Write-Host " "

}

Write-Host ("Application: " + $app.DisplayName + "(ServicePrinc. ObjID:" + $aadapServPrincObjId + ")")
Write-Host ("")
Write-Host ("Assigned (directly and through group membership) users:")
Write-Host ("")

$number=0

foreach ($item in $users) {

$listOfAssignments = Get-MgUserAppRoleAssignment -UserId $item.Id

$assigned = $false

foreach ($item2 in $listOfAssignments) { if ($item2.ResourceId -eq $aadapServPrincObjId) { $assigned = $true } }

If ($assigned -eq $true) {
        Write-Host ("DisplayName: " + $item.DisplayName + " UPN: " + $item.UserPrincipalName + " ObjectID: " + $item.Id)
        $number = $number + 1
     }
}

Write-Host ("")
Write-Host ("Number of (directly and through group membership) users: " + $number)
Write-Host ("")
Write-Host ("")
Write-Host ("Assigned groups:")
Write-Host ("")

$number=0

foreach ($item in $groups) {

$listOfAssignments = Get-MgGroupAppRoleAssignment -GroupId $item.Id

$assigned = $false

foreach ($item2 in $listOfAssignments) { If ($item2.ResourceID -eq $aadapServPrincObjId) { $assigned = $true } }

If ($assigned -eq $true) {
        Write-Host ("DisplayName: " + $item.DisplayName + " ObjectID: " + $item.Id)
        $number=$number+1
   }
}

Write-Host ("")
Write-Host ("Number of assigned groups: " + $number)
Write-Host ("")

Write-Host ("")
Write-Host ("Finished.") -BackgroundColor "Black" -ForegroundColor "Green"
Write-Host ("") 
Write-Host "To disconnect from Microsoft Graph, please use the Disconnect-MgGraph cmdlet."
}