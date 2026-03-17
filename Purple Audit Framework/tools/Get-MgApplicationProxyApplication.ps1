# This script is a part of Attacking and Defending Azure - Beginner's Edition course by Altered Security
# https://www.alteredsecurity.com/azureadlab

$token = (Get-AzAccessToken -ResourceUrl "https://graph.microsoft.com/").Token

if (-not $token) {
    Write-Host "[+] Failed to retrieve access token." -ForegroundColor Red
    exit
} else {
    Write-Host "[+] Access token retrieved successfully." -ForegroundColor Green
}

$applicationsUrl = "https://graph.microsoft.com/beta/applications"

Write-Host "Retrieving applications from Microsoft Graph..." -ForegroundColor Cyan
$applications = Invoke-RestMethod -Uri $applicationsUrl -Headers @{ Authorization = "Bearer $token" }

if (-not $applications) {
	Write-Host "[-] No applications found or failed to retrieve applications." -ForegroundColor Red
    exit
} else {
    Write-Host "[+] Successfully retrieved applications." -ForegroundColor Green
}

foreach ($application in $applications.value) {
    $objectId = $application.id
    $displayName = $application.displayName

    try {
        $proxyUrl = "$applicationsUrl/$objectId/onPremisesPublishing"

        $proxyDetail = Invoke-RestMethod -Uri $proxyUrl -Method Get -Headers @{ Authorization = "Bearer $token" }

        if ($proxyDetail) {
			Write-Host ""
            Write-Host "Application Proxy used by application: '$displayName'" -ForegroundColor White
            Write-Host "External URL: $($proxyDetail.externalUrl)" -ForegroundColor White
            Write-Host "Internal URL: $($proxyDetail.internalUrl)" -ForegroundColor White
            Write-Host "External Authentication Type: $($proxyDetail.externalAuthenticationType)" -ForegroundColor White
        } else {
        }
    } catch {
    }
}